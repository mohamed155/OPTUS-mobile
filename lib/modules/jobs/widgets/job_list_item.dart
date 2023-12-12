import 'package:flutter/material.dart';
import 'package:tech2/modules/jobs/models/bulk_routing_result.dart';
import 'package:tech2/utilities/date_formatter.dart';

class JobListItem extends StatelessWidget {
  const JobListItem({super.key, required this.jobVisit});

  final BulkRoutingResult jobVisit;

  void onSelectJob(int jobVisitId, BuildContext context) {
    Navigator.pushNamed(
      context,
      '/job-details',
      arguments: jobVisitId,
    );
  }

  @override
  Widget build(BuildContext context) {
    const labelFontStyle = TextStyle(fontWeight: FontWeight.bold);

    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: () => onSelectJob(jobVisit.jobVisitId, context),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                spreadRadius: -4,
                blurRadius: 5,
              ),
            ],
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Wrap(
                runSpacing: 10,
                children: [
                  Row(
                    children: [
                      const Text('Type: ', style: labelFontStyle),
                      Text(jobVisit.jobTypeCode),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Client Job Number: ',
                        style: labelFontStyle,
                      ),
                      Text(jobVisit.clientJobNumber),
                    ],
                  ),
                  ...jobVisit.clientVisitNumber != null
                      ? [
                          Row(
                            children: [
                              const Text(
                                'Client Visit Number: ',
                                style: labelFontStyle,
                              ),
                              Text(
                                jobVisit.clientVisitNumber!,
                              ),
                            ],
                          ),
                        ]
                      : [],
                  Row(
                    children: [
                      const Text(
                        'Job Number: ',
                        style: labelFontStyle,
                      ),
                      Text('${jobVisit.jobNumber}'),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Status: ', style: labelFontStyle),
                      Text(
                        '${jobVisit.jobStatusType}',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('State: ', style: labelFontStyle),
                      Text('${jobVisit.state}'),
                    ],
                  ),
                  ...jobVisit.bookedDate != null
                      ? [
                          Row(
                            children: [
                              const Text(
                                'Booked Date: ',
                                style: labelFontStyle,
                              ),
                              Text(
                                DateFormatter().formatDate(
                                  jobVisit.bookedDate!,
                                ),
                              ),
                            ],
                          ),
                        ]
                      : [],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
