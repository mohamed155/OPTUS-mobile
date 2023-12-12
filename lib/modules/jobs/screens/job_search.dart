import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tech2/models/list_dto.dart';
import 'package:tech2/modules/jobs/models/bulk_routing_parameters.dart';
import 'package:tech2/modules/jobs/models/bulk_routing_result.dart';
import 'package:tech2/modules/jobs/services/jobs_service.dart';
import 'package:tech2/services/list_service.dart';
import 'package:tech2/services/security.dart';
import 'package:tech2/widgets/date_range_input.dart';

class JobsSearchScreen extends StatefulWidget {
  const JobsSearchScreen({super.key});

  @override
  State<JobsSearchScreen> createState() => _JobsSearchScreenState();
}

class _JobsSearchScreenState extends State<JobsSearchScreen> {
  List<ListDto<int, String>> listOfProjectRegion = [];
  List<ListDto<String, String>> listOfJobStatuses = [];
  List<ListDto<int, String>> listOfSubRegions = [];
  List<BulkRoutingResult> listOfJobs = [];

  List<int> selectedProjectRegionIds = [];
  List<String> selectedJobStatuses = ['Open', 'Pending'];
  List<int> selectedSubRegions = [];

  bool isProjectRegionLoading = false;
  bool isJobStatusLoading = false;
  bool isJobSubRegionsLoading = false;
  bool isJobsLoading = false;

  DateTime startDate = DateTime.now().subtract(const Duration(days: 29));
  DateTime endDate = DateTime.now().add(const Duration(days: 4));

  bool? includeJobsWithoutDate = true;
  bool? includeUnreleasedJobs = false;

  int currentIndex = 0;

  CarouselController sliderController = CarouselController();

  final numOfSlides = 4;

  @override
  void initState() {
    super.initState();

    loadControls();
  }

  void loadControls() {
    loadWorkerProjectRegionList();
    loadJobStatusList();
  }

  Future<void> loadWorkerProjectRegionList() async {
    setState(() => isProjectRegionLoading = true);
    unawaited(
      ListService().loadWorkerProjectRegionList(SecurityService.workerId).then(
            (List<ListDto<int, String>> data) => setState(() {
              listOfProjectRegion = data;
              isProjectRegionLoading = false;
            }),
          ),
    );
  }

  void loadJobStatusList() {
    setState(() => isJobStatusLoading = true);
    ListService().loadJobStatusList().then(
          (List<ListDto<String, String>> data) => setState(() {
            listOfJobStatuses = data;
            isJobStatusLoading = false;
          }),
        );
  }

  void loadJobs() {
    setState(() => isJobsLoading = true);
    final model = BulkRoutingParameters(
      SecurityService.workerId,
      selectedProjectRegionIds,
      selectedSubRegions,
      selectedJobStatuses,
      startDate,
      endDate,
      includeNoDate: includeJobsWithoutDate!,
      includeUnreleased: includeUnreleasedJobs!,
      limitedUser: false,
    );
    JobsService()
        .getListOfBulkRoutingJobs(model)
        .then((List<BulkRoutingResult> data) {
      setState(() => isJobsLoading = false);
      Navigator.pushNamed(context, '/jobs', arguments: data);
    });
  }

  void onChangeProjectSelection(List<int> value) {
    setState(() {
      selectedProjectRegionIds = value;
    });
    if (selectedProjectRegionIds.isNotEmpty) {
      setState(() {
        isJobSubRegionsLoading = true;
      });

      ListService()
          .loadSubRegionListByProjectRegionId(selectedProjectRegionIds)
          .then(
            (List<ListDto<int, String>> data) => setState(() {
              listOfSubRegions = data;
              selectedSubRegions = data.map((item) => item.key).toList();
              isJobSubRegionsLoading = false;
            }),
          );
    }
  }

  void handleOnPageChanged(int index, _) {
    setState(() => currentIndex = index);
    if (index == 1) {
      onChangeProjectSelection(selectedProjectRegionIds);
    }
  }

  void goPrevSlide() {
    if (currentIndex > 0) {
      sliderController.previousPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.ease,
      );
    }
  }

  void goNextSlide() {
    if (currentIndex < numOfSlides - 1) {
      sliderController.nextPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.ease,
      );
    }
  }

  Widget get loader {
    return Center(
      child: SizedBox(
        width: 90,
        height: 90,
        child: SizedBox.expand(
          child: CircularProgressIndicator(
            strokeWidth: 5,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: const Text('Job Search')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 1,
            colors: [
              Colors.black87,
              Colors.black,
            ],
            stops: [0.1, 10],
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            CarouselSlider(
              carouselController: sliderController,
              options: CarouselOptions(
                height: screenHeight,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                scrollPhysics: const NeverScrollableScrollPhysics(),
                onPageChanged: handleOnPageChanged,
              ),
              items: [
                ...isProjectRegionLoading
                    ? [loader]
                    : [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                'Select project regions',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: listOfProjectRegion.length + 1,
                                itemBuilder: (_, index) {
                                  if (index == listOfProjectRegion.length) {
                                    return const SizedBox(
                                      height: 80,
                                    );
                                  }
                                  return CheckboxListTile(
                                    title: Text(
                                      listOfProjectRegion[index].value,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    value: selectedProjectRegionIds.contains(
                                      listOfProjectRegion[index].key,
                                    ),
                                    onChanged: (bool? value) {
                                      if (value != null && value) {
                                        setState(() {
                                          selectedProjectRegionIds.add(
                                            listOfProjectRegion[index].key,
                                          );
                                        });
                                      } else {
                                        setState(() {
                                          selectedProjectRegionIds.remove(
                                            listOfProjectRegion[index].key,
                                          );
                                        });
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                ...isJobSubRegionsLoading
                    ? [loader]
                    : [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                'Select sub regions',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: listOfSubRegions.length + 1,
                                itemBuilder: (_, index) {
                                  if (index == listOfSubRegions.length) {
                                    return const SizedBox(
                                      height: 80,
                                    );
                                  }
                                  return CheckboxListTile(
                                    title: Text(
                                      listOfSubRegions[index].value,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    value: selectedSubRegions
                                        .contains(listOfSubRegions[index].key),
                                    onChanged: (bool? value) {
                                      if (value != null && value) {
                                        setState(() {
                                          selectedSubRegions.add(
                                            listOfSubRegions[index].key,
                                          );
                                        });
                                      } else {
                                        setState(() {
                                          selectedSubRegions.remove(
                                            listOfSubRegions[index].key,
                                          );
                                        });
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Select job status',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: listOfJobStatuses.length + 1,
                        itemBuilder: (_, index) {
                          if (index == listOfJobStatuses.length) {
                            return const SizedBox(
                              height: 80,
                            );
                          }
                          return CheckboxListTile(
                            title: Text(
                              listOfJobStatuses[index].value,
                              style: const TextStyle(color: Colors.white),
                            ),
                            value: selectedJobStatuses
                                .contains(listOfJobStatuses[index].key),
                            onChanged: (bool? value) {
                              if (value != null && value) {
                                setState(() {
                                  selectedJobStatuses.add(
                                    listOfJobStatuses[index].key,
                                  );
                                });
                              } else {
                                setState(() {
                                  selectedJobStatuses.remove(
                                    listOfJobStatuses[index].key,
                                  );
                                });
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: DateRangeInput(
                        startDate: startDate,
                        endDate: endDate,
                        onChange: (DateTime startDate, DateTime endDate) =>
                            setState(() {
                          this.startDate = startDate;
                          this.endDate = endDate;
                        }),
                      ),
                    ),
                    CheckboxListTile(
                      title: const Text(
                        'Include Jobs without date',
                        style: TextStyle(color: Colors.white),
                      ),
                      value: includeJobsWithoutDate,
                      onChanged: (value) =>
                          setState(() => includeJobsWithoutDate = value),
                    ),
                    CheckboxListTile(
                      title: const Text(
                        'Include Unreleased Jobs',
                        style: TextStyle(color: Colors.white),
                      ),
                      value: includeUnreleasedJobs,
                      onChanged: (value) =>
                          setState(() => includeUnreleasedJobs = value),
                    ),
                  ],
                ),
              ],
            ),
            ...currentIndex < numOfSlides - 1
                ? [
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: FloatingActionButton(
                        foregroundColor: Colors.white,
                        onPressed: goNextSlide,
                        child: const Icon(Icons.arrow_forward),
                      ),
                    ),
                  ]
                : [],
            ...currentIndex > 0
                ? [
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: FloatingActionButton(
                        foregroundColor: Colors.white,
                        onPressed: goPrevSlide,
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                  ]
                : [],
            ...currentIndex == numOfSlides - 1
                ? [
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: FloatingActionButton.extended(
                        foregroundColor: Colors.white,
                        label: Row(
                          children: [
                            const Text('Search'),
                            const SizedBox(
                              width: 8,
                            ),
                            if (isJobsLoading)
                              const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3,
                                ),
                              )
                            else
                              const Icon(Icons.search),
                          ],
                        ),
                        onPressed: loadJobs,
                      ),
                    ),
                  ]
                : [],
          ],
        ),
      ),
    );
  }
}
