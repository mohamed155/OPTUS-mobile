import 'package:flutter/material.dart';

import 'package:tech2/modules/jobs/models/job_visit_model.dart';
import 'package:tech2/modules/jobs/services/jobs_services.dart';
import 'package:tech2/utilities/date_formatter.dart';

class JobDetailsScreen extends StatefulWidget {
  final int jobVisitId;

  const JobDetailsScreen({Key? key, required this.jobVisitId})
      : super(key: key);

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  JobVisitModel? jobVisit;
  bool loading = false;

  TextStyle textStyle = const TextStyle(color: Colors.white, fontSize: 18);
  TextStyle labelFontStyle = const TextStyle(
      fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold);

  BoxDecoration containerDecoration = BoxDecoration(
      border: Border.all(width: 1, color: Colors.white),
      borderRadius: BorderRadius.circular(10));

  @override
  void initState() {
    super.initState();

    loadJobVisitModel();
  }

  loadJobVisitModel() {
    setState(() => loading = true);
    JobsService.getJobVisitModel(widget.jobVisitId).then((data) => setState(() {
          loading = false;
          jobVisit = data;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(jobVisit != null
                ? 'Job ${jobVisit!.jobDetailsDto.clientJobNumber}'
                : 'Job')),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: RadialGradient(radius: 1, colors: [
            Colors.black87,
            Colors.black,
          ], stops: [
            0.1,
            10
          ])),
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
                                    jobVisit!.projectDetailsDto
                                        .projectCodeRegionName,
                                    style: textStyle),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Job Type:', style: labelFontStyle),
                                Text(jobVisit!.jobTypeDetailsDto.jobTypeCode,
                                    style: textStyle),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Status:', style: labelFontStyle),
                                Text(jobVisit!.jobStatusDetailsDto.jobStatus,
                                    style: textStyle),
                              ],
                            ),
                            ...jobVisit!.jobVisitModelDetailsDto.bookedDate !=
                                    null
                                ? [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Booked Date:',
                                            style: labelFontStyle),
                                        Text(
                                            DateFormatter.formatDate(jobVisit!
                                                .jobVisitModelDetailsDto
                                                .bookedDate!),
                                            style: textStyle),
                                      ],
                                    )
                                  ]
                                : [],
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Time slot:', style: labelFontStyle),
                                Text(
                                    jobVisit!
                                        .jobVisitModelDetailsDto.bookedTimeSlot,
                                    style: textStyle),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('BAL:', style: labelFontStyle),
                                Text(jobVisit!.jobDetailsDto.bal,
                                    style: textStyle),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Routed to:', style: labelFontStyle),
                                Text(jobVisit!.jobDetailsDto.routedTo,
                                    style: textStyle),
                              ],
                            ),
                            ...jobVisit!.jobDetailsDto.requestDate != null
                                ? [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Request Date:',
                                            style: labelFontStyle),
                                        Text(
                                            DateFormatter.formatDate(jobVisit!
                                                .jobDetailsDto.requestDate!),
                                            style: textStyle),
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
                                        Text('Completed:',
                                            style: labelFontStyle),
                                        Text(
                                            DateFormatter.formatDate(jobVisit!
                                                .jobDetailsDto.completedDate!),
                                            style: textStyle),
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
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        constraints: const BoxConstraints(minHeight: 100),
                        child: Text(
                          jobVisit!.jobDetailsDto.jobDesc,
                          style: textStyle,
                        ),
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
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          jobVisit!.jobVisitModelDetailsDto.routingAlert ?? '',
                          style: textStyle,
                        ),
                      ),
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
        ));
  }
}
