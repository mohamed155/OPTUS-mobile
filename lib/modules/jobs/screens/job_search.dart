import 'package:flutter/material.dart';
import 'package:tech2/models/list_dto.dart';
import 'package:tech2/modules/jobs/models/bulk_routing_parameters.dart';
import 'package:tech2/modules/jobs/models/bulk_routing_result.dart';
import 'package:tech2/modules/jobs/services/jobs_service.dart';
import 'package:tech2/services/list_service.dart';
import 'package:tech2/services/security.dart';
import 'package:tech2/widgets/date_range_input.dart';
import 'package:tech2/widgets/multiselect_dropdown.dart';
import 'package:tech2/widgets/shared_app_bar.dart';

class JobsSearchScreen extends StatefulWidget {
  final VoidCallback openDrawer;

  const JobsSearchScreen({Key? key, required this.openDrawer})
      : super(key: key);

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

  @override
  initState() {
    super.initState();

    loadControls();
  }

  loadControls() {
    loadWorkerProjectRegionList();
    loadJobStatusList();
  }

  loadWorkerProjectRegionList() async {
    setState(() => isProjectRegionLoading = true);
    ListService.loadWorkerProjectRegionList(SecurityService.workerId)
        .then((List<ListDto<int, String>> data) => setState(() {
              listOfProjectRegion = data;
              isProjectRegionLoading = false;
            }));
  }

  loadJobStatusList() {
    setState(() => isJobStatusLoading = true);
    ListService.loadJobStatusList()
        .then((List<ListDto<String, String>> data) => setState(() {
              listOfJobStatuses = data;
              isJobStatusLoading = false;
            }));
  }

  loadJobs() {
    setState(() => isJobsLoading = true);
    BulkRoutingParameters model = BulkRoutingParameters(
        SecurityService.workerId,
        selectedProjectRegionIds,
        selectedSubRegions,
        selectedJobStatuses,
        startDate,
        endDate,
        includeJobsWithoutDate!,
        includeUnreleasedJobs!,
        false);
    JobsService.getListOfBulkRoutingJobs(model)
        .then((List<BulkRoutingResult> data) {
      setState(() => isJobsLoading = false);
      Navigator.pushNamed(context, '/jobs', arguments: data);
    });
  }

  onChangeProjectSelection(List<int> value) {
    setState(() {
      selectedProjectRegionIds = value;
    });
    if (selectedProjectRegionIds.isNotEmpty) {
      setState(() {
        isJobSubRegionsLoading = true;
      });

      ListService.loadSubRegionListByProjectRegionId(selectedProjectRegionIds)
          .then((List<ListDto<int, String>> data) => setState(() {
                listOfSubRegions = data;
                selectedSubRegions = data.map((item) => item.key).toList();
                isJobSubRegionsLoading = false;
              }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        menuButtonHandler: widget.openDrawer,
        refreshButtonHandler: loadControls,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(radius: 1, colors: [
          Colors.black87,
          Colors.black,
        ], stops: [
          0.1,
          10
        ])),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MultiselectDropdown<int>(
                    label: "Project Region",
                    items: listOfProjectRegion,
                    value: selectedProjectRegionIds,
                    valueProp: 'key',
                    labelProp: 'value',
                    isLoading: isProjectRegionLoading,
                    onChanged: onChangeProjectSelection),
                MultiselectDropdown<int>(
                    label: "Sub Region",
                    items: listOfSubRegions,
                    value: selectedSubRegions,
                    valueProp: 'key',
                    labelProp: 'value',
                    isLoading: isJobSubRegionsLoading,
                    onChanged: (dynamic value) =>
                        setState(() => selectedSubRegions = value)),
                MultiselectDropdown<String>(
                    label: "Status",
                    items: listOfJobStatuses,
                    value: selectedJobStatuses,
                    valueProp: 'key',
                    labelProp: 'value',
                    isLoading: isJobStatusLoading,
                    onChanged: (dynamic value) =>
                        setState(() => selectedJobStatuses = value)),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
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
                    title: const Text('Include Jobs without date',
                        style: TextStyle(color: Colors.white)),
                    value: includeJobsWithoutDate,
                    onChanged: (value) =>
                        setState(() => includeJobsWithoutDate = value)),
                CheckboxListTile(
                    title: const Text('Include Unreleased Jobs',
                        style: TextStyle(color: Colors.white)),
                    value: includeUnreleasedJobs,
                    onChanged: (value) =>
                        setState(() => includeUnreleasedJobs = value)),
                ElevatedButton(
                    onPressed: isJobsLoading ? null : loadJobs,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...isJobsLoading
                            ? [
                                const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 3,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                )
                              ]
                            : [],
                        const Text('Search'),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
