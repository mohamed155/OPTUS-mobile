import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:tech2/modules/jobs/models/items.dart';
import 'package:tech2/modules/jobs/models/job_status.dart';
import 'package:tech2/modules/jobs/models/job_visit_model.dart';
import 'package:tech2/modules/jobs/screens/job_location.dart';
import 'package:tech2/modules/jobs/services/jobs_service.dart';
import 'package:tech2/utilities/date_formatter.dart';

class JobDetailsScreen extends StatefulWidget {
  const JobDetailsScreen({super.key, required this.jobVisitId});

  final int jobVisitId;

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  JobVisitModel? jobVisit;

  TextStyle textStyle = const TextStyle(color: Colors.white, fontSize: 16);
  TextStyle labelFontStyle = const TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  BoxDecoration containerDecoration = BoxDecoration(
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(10),
  );

  @override
  void initState() {
    super.initState();
    loadJobVisitModel();
  }

  void loadJobVisitModel() {
    JobsService().getJobVisitModel(widget.jobVisitId).then(
          (data) => setState(() {
            jobVisit = data;
          }),
        );
  }

  void openJobMap() {
    if (jobVisit != null) {
      Navigator.push(
        context,
        MaterialPageRoute<JobLocationScreen>(
          builder: (_) => JobLocationScreen(
            latitude: jobVisit!.siteDetailsDto.latitude!,
            longitude: jobVisit!.siteDetailsDto.longitude!,
          ),
        ),
      );
    }
  }

  void openJobForms() {
    Navigator.pushNamed(
      context,
      '/job-forms',
      arguments: jobVisit!.jobVisitModelDetailsDto.jobVisitId,
    );
  }

  void openJobDocs() {
    Navigator.pushNamed(
      context,
      '/docs',
      arguments: jobVisit!.jobDetailsDto.jobId,
    );
  }

  void openJobItems() {
    Navigator.pushNamed(
      context,
      '/job-items',
      arguments: JobItemsArgs(
        jobVisit!.jobDetailsDto.jobId!,
        jobVisit!.jobVisitModelDetailsDto.jobTypeId!,
        jobVisit!.jobVisitModelDetailsDto.jobVisitId!,
        jobVisit!.projectDetailsDto.projectId!,
        jobVisit!.jobVisitModelDetailsDto.projectRegionId!,
        jobVisit!.jobDetailsDto.sourceCustomerId ?? 0,
      ),
    );
  }

  Future<JobStatusDto> getJobStatus(int statusId) {
    return JobsService().getJobStatusInfo(statusId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          jobVisit != null
              ? 'Job ${jobVisit!.jobDetailsDto.clientJobNumber}'
              : 'Job',
        ),
        actions: jobVisit != null &&
                jobVisit!.siteDetailsDto.latitude != null &&
                jobVisit!.siteDetailsDto.longitude != null
            ? [
                IconButton(
                  onPressed: openJobMap,
                  icon: const Icon(Icons.map_rounded),
                )
              ]
            : [],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
        child: jobVisit != null
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: containerDecoration,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      child: Wrap(
                        runSpacing: 5,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Client Job Number:',
                                style: labelFontStyle,
                              ),
                              Text(
                                jobVisit!.jobDetailsDto.clientJobNumber,
                                style: textStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Project Region:', style: labelFontStyle),
                              Text(
                                jobVisit!
                                    .projectDetailsDto.projectCodeRegionName,
                                style: textStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Job Type:', style: labelFontStyle),
                              Text(
                                jobVisit!.jobTypeDetailsDto.jobTypeCode,
                                style: textStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Status:', style: labelFontStyle),
                              Text(
                                jobVisit!.jobStatusDetailsDto.jobStatus,
                                style: textStyle,
                              ),
                            ],
                          ),
                          ...jobVisit!.jobVisitModelDetailsDto.bookedDate !=
                                  null
                              ? [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Booked Date:',
                                        style: labelFontStyle,
                                      ),
                                      Text(
                                        DateFormatter.formatDate(
                                          jobVisit!.jobVisitModelDetailsDto
                                              .bookedDate!,
                                        ),
                                        style: textStyle,
                                      ),
                                    ],
                                  )
                                ]
                              : [],
                          ...jobVisit!.jobVisitModelDetailsDto.bookedTimeSlot !=
                                  null
                              ? [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Time slot:',
                                        style: labelFontStyle,
                                      ),
                                      Text(
                                        jobVisit!.jobVisitModelDetailsDto
                                            .bookedTimeSlot!,
                                        style: textStyle,
                                      ),
                                    ],
                                  )
                                ]
                              : [],
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('BAL:', style: labelFontStyle),
                              Text(
                                jobVisit!.jobDetailsDto.bal,
                                style: textStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Routed to:', style: labelFontStyle),
                              Text(
                                jobVisit!.jobDetailsDto.routedTo,
                                style: textStyle,
                              ),
                            ],
                          ),
                          ...jobVisit!.jobDetailsDto.requestDate != null
                              ? [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Request Date:',
                                        style: labelFontStyle,
                                      ),
                                      Text(
                                        DateFormatter.formatDate(
                                          jobVisit!.jobDetailsDto.requestDate!,
                                        ),
                                        style: textStyle,
                                      ),
                                    ],
                                  )
                                ]
                              : [],
                          ...jobVisit!.jobDetailsDto.completedDate != null
                              ? [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Completed:',
                                        style: labelFontStyle,
                                      ),
                                      Text(
                                        DateFormatter.formatDate(
                                          jobVisit!
                                              .jobDetailsDto.completedDate!,
                                        ),
                                        style: textStyle,
                                      ),
                                    ],
                                  )
                                ]
                              : [],
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Job Description',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Container(
                      decoration: containerDecoration,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.all(10),
                      constraints: const BoxConstraints(minHeight: 100),
                      child: Text(
                        jobVisit!.jobDetailsDto.jobDesc,
                        style: textStyle,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Routing Alert',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Container(
                      decoration: containerDecoration,
                      constraints: const BoxConstraints(minHeight: 100),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        jobVisit!.jobVisitModelDetailsDto.routingAlert ?? '',
                        style: textStyle,
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    )
                  ],
                ),
              )
            : Center(
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
              ),
      ),
      floatingActionButton: jobVisit != null
          ? SpeedDial(
              spaceBetweenChildren: 8,
              icon: Icons.menu,
              activeIcon: Icons.close,
              overlayColor: Colors.black,
              children: [
                SpeedDialChild(
                  label: 'Start job',
                  backgroundColor: Colors.green,
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                  ),
                ),
                SpeedDialChild(
                  label: 'Capture',
                  backgroundColor: Theme.of(context).primaryColor,
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                ),
                SpeedDialChild(
                  label: 'Attach',
                  backgroundColor: Theme.of(context).primaryColor,
                  child: const Icon(
                    Icons.attach_file,
                    color: Colors.white,
                  ),
                ),
                SpeedDialChild(
                  label: 'Docs',
                  backgroundColor: Theme.of(context).primaryColor,
                  onTap: openJobDocs,
                  child: const Icon(
                    Icons.image,
                    color: Colors.white,
                  ),
                ),
                SpeedDialChild(
                  label: 'Items',
                  backgroundColor: Theme.of(context).primaryColor,
                  onTap: openJobItems,
                  child: const Icon(
                    Icons.settings_applications_outlined,
                    color: Colors.white,
                  ),
                ),
                SpeedDialChild(
                  label: 'Forms',
                  backgroundColor: Theme.of(context).primaryColor,
                  onTap: openJobForms,
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          : null,
    );
  }
}
