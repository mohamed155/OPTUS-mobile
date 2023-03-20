import 'package:flutter/material.dart';
import 'package:tech2/widgets/shared_app_bar.dart';

class JobsHomeScreen extends StatefulWidget {
  const JobsHomeScreen({super.key, required this.openDrawer});

  final VoidCallback openDrawer;

  @override
  State<JobsHomeScreen> createState() => _JobsHomeState();
}

class _JobsHomeState extends State<JobsHomeScreen> {
  void openSearchJobs() {
    Navigator.of(context).pushNamed('/jobs-search');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(menuButtonHandler: widget.openDrawer),
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            ElevatedButton.icon(
              onPressed: openSearchJobs,
              icon: const Icon(Icons.search),
              label: const Text('Search all jobs'),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              height: 1,
              color: Colors.white,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'You do not have any jobs assigned',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
