import 'package:flutter/material.dart';
import 'package:tech2/modules/jobs/models/bulk_routing_result.dart';
import 'package:tech2/modules/jobs/models/forms.dart';
import 'package:tech2/modules/jobs/models/items.dart';
import 'package:tech2/modules/jobs/screens/form_details.dart';
import 'package:tech2/modules/jobs/screens/job_details.dart';
import 'package:tech2/modules/jobs/screens/job_docs.dart';
import 'package:tech2/modules/jobs/screens/job_forms.dart';
import 'package:tech2/modules/jobs/screens/job_items.dart';
import 'package:tech2/modules/jobs/screens/job_search.dart';
import 'package:tech2/modules/jobs/screens/jobs_list.dart';
import 'package:tech2/modules/login/screens/index.dart';
import 'package:tech2/services/security.dart';
import 'package:tech2/widgets/hidden_drawer.dart';

class RouteGenerator {
  factory RouteGenerator() {
    return _instance;
  }

  RouteGenerator._create();

  static final _instance = RouteGenerator._create();

  Route<MaterialPageRoute<dynamic>> generateRoute(RouteSettings settings) {
    late Widget screen;
    if (SecurityService.isUserSignedIn) {
      switch (settings.name) {
        case '/':
          screen = const HiddenDrawer();
          break;
        case '/jobs-search':
          screen = const JobsSearchScreen();
          break;
        case '/jobs':
          if (settings.arguments is List<BulkRoutingResult>) {
            screen = JobsListScreen(
              jobs: settings.arguments! as List<BulkRoutingResult>,
            );
          }
          break;
        case '/job-details':
          if (settings.arguments is int) {
            screen = JobDetailsScreen(jobVisitId: settings.arguments! as int);
          }
          break;
        case '/job-forms':
          if (settings.arguments is int) {
            screen = JobFormsScreen(jobVisitId: settings.arguments! as int);
          }
          break;
        case '/form-details':
          if (settings.arguments is FormDetailInput) {
            screen = FormDetailsScreen(
              formDetailsInput: settings.arguments! as FormDetailInput,
            );
          }
          break;
        case '/docs':
          if (settings.arguments is int) {
            screen = JobDocuments(jobId: settings.arguments! as int);
          }
          break;
        case '/job-items':
          if (settings.arguments is JobItemsArgs) {
            final args = settings.arguments! as JobItemsArgs;
            screen = JobItems(
              jobId: args.jobId,
              jobTypeId: args.jobTypeId,
              jobVisitId: args.jobVisitId,
              projectId: args.projectId,
              projectRegionId: args.projectRegionId,
              sourceCustomerId: args.sourceCustomerId,
            );
          }
          break;
      }
    } else {
      screen = const LoginScreen();
    }

    return MaterialPageRoute(builder: (context) => screen);
  }
}
