import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tech2/modules/jobs/models/bulk_routing_result.dart';
import 'package:tech2/modules/jobs/widgets/job_list_item.dart';

class JobsListScreen extends StatefulWidget {
  const JobsListScreen({super.key, required this.jobs});

  final List<BulkRoutingResult> jobs;

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
    locationJobs.addAll(
      widget.jobs.where((job) => job.latitude != null && job.longitude != null),
    );
  }

  LatLngBounds getLatLngBounds(List<LatLng> list) {
    double? x0;
    double? x1;
    double? y0;
    double? y1;

    for (final latLng in list) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1!) {
          x1 = latLng.latitude;
        }
        if (latLng.latitude < x0) {
          x0 = latLng.latitude;
        }
        if (latLng.longitude > y1!) {
          y1 = latLng.longitude;
        }
        if (latLng.longitude < y0!) {
          y0 = latLng.longitude;
        }
      }
    }
    return LatLngBounds(
      northeast: LatLng(x1!, y1!),
      southwest: LatLng(x0!, y0!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Jobs List'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.filter_alt)),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [Tab(child: Text('List')), Tab(child: Text('Map'))],
          ),
        ),
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
          height: double.infinity,
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.jobs.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.fromLTRB(10, 12, 10, 0),
                    child: JobListItem(jobVisit: widget.jobs[index]),
                  );
                },
              ),
              GoogleMap(
                initialCameraPosition: _kGooglePlex,
                markers: locationJobs
                    .map(
                      (job) => Marker(
                        markerId: MarkerId('${job.jobVisitId}'),
                        position: LatLng(job.latitude!, job.longitude!),
                      ),
                    )
                    .toSet(),
                onMapCreated: (GoogleMapController controller) =>
                    controller.animateCamera(
                  CameraUpdate.newLatLngBounds(
                    getLatLngBounds(
                      locationJobs
                          .map(
                            (job) => LatLng(job.latitude!, job.longitude!),
                          )
                          .toList(),
                    ),
                    20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
