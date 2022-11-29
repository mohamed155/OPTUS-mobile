import 'package:flutter/material.dart';

import 'package:tech2/modules/jobs/models/bulk_routing_result.dart';
import 'package:tech2/utilities/date_formatter.dart';

class JobsListScreen extends StatefulWidget {
  final List<BulkRoutingResult> jobs;

  const JobsListScreen({Key? key, required this.jobs}) : super(key: key);

  @override
  State<JobsListScreen> createState() => _JobsListScreenState();
}

class _JobsListScreenState extends State<JobsListScreen> {

  TextStyle labelFontStyle = const TextStyle(fontWeight: FontWeight.bold);

  onSelectJob(int index) {
    Navigator.pushNamed(context, '/job-details',
        arguments: widget.jobs[index].jobVisitId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Jobs List'),),
        body: Container(
          decoration: const BoxDecoration(
              gradient: RadialGradient(radius: 1, colors: [
            Colors.black87,
            Colors.black,
          ], stops: [
            0.1,
            10
          ])),
          height: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: widget.jobs.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: double.infinity,
                child: InkWell(
                  onTap: () => onSelectJob(index),
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Wrap(
                        direction: Axis.horizontal,
                        runSpacing: 10,
                        children: [
                          Row(children: [
                            Text('Type: ', style: labelFontStyle),
                            Text(widget.jobs[index].jobTypeCode)
                          ],),
                          Row(children: [
                            Text('Client Job Number: ', style: labelFontStyle),
                            Text(widget.jobs[index].clientJobNumber)
                          ],),
                          ...widget.jobs[index].clientVisitNumber != null ?
                          [Row(children: [
                            Text('Client Visit Number: ', style: labelFontStyle),
                            Text(widget.jobs[index].clientVisitNumber!)
                          ],)] : [],
                          Row(children: [
                            Text('Job Number: ', style: labelFontStyle),
                            Text('${widget.jobs[index].jobNumber}')
                          ],),
                          Row(children: [
                            Text('Status: ', style: labelFontStyle),
                            Text('${widget.jobs[index].jobStatusType}')
                          ],),
                          Row(children: [
                            Text('State: ', style: labelFontStyle),
                            Text('${widget.jobs[index].state}')
                          ],),
                          ...widget.jobs[index].bookedDate != null ?
                          [Row(children: [
                            Text('Booked Date: ', style: labelFontStyle),
                            Text(DateFormatter.formatDate(widget.jobs[index].bookedDate!))
                          ],)]: [],
                        ],
                      ),
                    )
                  ),
                ),
              );
            }
          ),
        ));
  }
}
