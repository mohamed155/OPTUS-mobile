import 'package:flutter/material.dart';
import 'package:tech2/modules/jobs/models/bulk_routing_parameters.dart';
import 'package:tech2/modules/jobs/models/bulk_routing_result.dart';
import 'package:tech2/modules/jobs/services/jobs_service.dart';
import 'package:tech2/modules/jobs/widgets/job_list_item.dart';
import 'package:tech2/services/security.dart';
import 'package:tech2/widgets/shared_app_bar.dart';

class JobsHomeScreen extends StatefulWidget {
  const JobsHomeScreen({super.key, required this.openDrawer});

  final VoidCallback openDrawer;

  @override
  State<JobsHomeScreen> createState() => _JobsHomeState();
}

class _JobsHomeState extends State<JobsHomeScreen> {
  List<BulkRoutingResult> assignedJobs = [];
  bool isLoading = false;

  @override
  void initState() {
    loadAssignedJobs();
    super.initState();
  }

  void loadAssignedJobs() {
    setState(() {
      isLoading = true;
    });
    final workerId = SecurityService.workerId;
    JobsService()
        .getListOfBulkRoutingJobsForWorker(
          BulkRoutingParametersForWorker(workerId),
        )
        .then((value) => assignedJobs = value)
        .whenComplete(
          () => setState(() {
            isLoading = false;
          }),
        );
  }

  void openSearchJobs() {
    Navigator.of(context).pushNamed('/jobs-search');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        menuButtonHandler: widget.openDrawer,
        refreshButtonHandler: loadAssignedJobs,
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
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              onPressed: openSearchJobs,
              icon: const Icon(Icons.search),
              label: const Text('Search all jobs'),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 1,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            if (!isLoading && assignedJobs.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: assignedJobs.length,
                  itemBuilder: (context, index) {
                    final job = assignedJobs[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: JobListItem(jobVisit: job),
                    );
                  },
                ),
              )
            else if (isLoading)
              Center(
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
              )
            else
              const Text(
                'You do not have any jobs assigned',
                style: TextStyle(color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}
