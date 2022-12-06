import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:tech2/modules/jobs/models/bulk_routing_result.dart';
import 'package:tech2/utilities/date_formatter.dart';

class JobsListScreen extends StatefulWidget {
  final List<BulkRoutingResult> jobs;

  const JobsListScreen({Key? key, required this.jobs}) : super(key: key);

  @override
  State<JobsListScreen> createState() => _JobsListScreenState();
}

class _JobsListScreenState extends State<JobsListScreen> {
  final List<BulkRoutingResult> locationJobs = [];

  TextStyle labelFontStyle = const TextStyle(fontWeight: FontWeight.bold);

  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(-37.8167, 144.9626),
    zoom: 5,
  );

  @override
  void initState() {
    super.initState();
    locationJobs.addAll(widget.jobs
        .where((job) => job.latitude != null && job.longitude != null));
  }

  LatLngBounds getLatLngBounds(List<LatLng> list) {
    double? x0, x1, y0, y1;
    for (final latLng in list) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1!) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1!) y1 = latLng.longitude;
        if (latLng.longitude < y0!) y0 = latLng.longitude;
      }
    }
    return LatLngBounds(
        northeast: LatLng(x1!, y1!), southwest: LatLng(x0!, y0!));
  }

  onSelectJob(int index) {
    Navigator.pushNamed(context, '/job-details',
        arguments: widget.jobs[index].jobVisitId);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Jobs List'),
            bottom: const TabBar(
                tabs: [Tab(child: Text('List')), Tab(child: Text('Map'))]),
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
            height: double.infinity,
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ListView.builder(
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
                                    Row(
                                      children: [
                                        Text('Type: ', style: labelFontStyle),
                                        Text(widget.jobs[index].jobTypeCode)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Client Job Number: ',
                                            style: labelFontStyle),
                                        Text(widget.jobs[index].clientJobNumber)
                                      ],
                                    ),
                                    ...widget.jobs[index].clientVisitNumber !=
                                            null
                                        ? [
                                            Row(
                                              children: [
                                                Text('Client Visit Number: ',
                                                    style: labelFontStyle),
                                                Text(widget.jobs[index]
                                                    .clientVisitNumber!)
                                              ],
                                            )
                                          ]
                                        : [],
                                    Row(
                                      children: [
                                        Text('Job Number: ',
                                            style: labelFontStyle),
                                        Text('${widget.jobs[index].jobNumber}')
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Status: ', style: labelFontStyle),
                                        Text(
                                            '${widget.jobs[index].jobStatusType}')
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('State: ', style: labelFontStyle),
                                        Text('${widget.jobs[index].state}')
                                      ],
                                    ),
                                    ...widget.jobs[index].bookedDate != null
                                        ? [
                                            Row(
                                              children: [
                                                Text('Booked Date: ',
                                                    style: labelFontStyle),
                                                Text(DateFormatter.formatDate(
                                                    widget.jobs[index]
                                                        .bookedDate!))
                                              ],
                                            )
                                          ]
                                        : [],
                                  ],
                                ),
                              )),
                        ),
                      );
                    }),
                GoogleMap(
                  initialCameraPosition: _kGooglePlex,
                  markers: locationJobs
                      .map((job) => Marker(
                          markerId: MarkerId('${job.jobVisitId}'),
                          position: LatLng(job.latitude!, job.longitude!)))
                      .toSet(),
                  onMapCreated: (GoogleMapController controller) =>
                      controller.animateCamera(CameraUpdate.newLatLngBounds(
                          getLatLngBounds(locationJobs
                              .map((job) =>
                                  LatLng(job.latitude!, job.longitude!))
                              .toList()),
                          20)),
                ),
              ],
            ),
          )),
    );
  }
}
