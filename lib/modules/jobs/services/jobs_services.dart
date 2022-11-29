import 'package:http/http.dart';

import 'package:tech2/config/app_config.dart';
import 'package:tech2/modules/jobs/models/bulk_routing_parameters.dart';
import 'package:tech2/modules/jobs/models/bulk_routing_result.dart';
import 'package:tech2/modules/jobs/models/job_visit_model.dart';
import 'package:tech2/services/connectivity.dart';
import 'package:tech2/services/security.dart';
import 'package:tech2/utilities/json_converter.dart';

class JobsService {

  static Future<List<BulkRoutingResult>> getListOfBulkRoutingJobs(BulkRoutingParameters model) {
    String url = '${apiBaseUrl}BulkRouting/GetListOfBulkRoutingJobs';
    return ConnectivityService.getData(url, model).then((result) {
      dynamic body;
      if (result is Response) {
        body = result.body;
      } else if (result is String) {
        body = result;
      }
      return List.of(JSONConverter.decode(body)['data'])
          .map((item) => BulkRoutingResult.fromJson(item))
          .toList();
    });
  }

  static Future<JobVisitModel> getJobVisitModel(int jobVisitId) {
    int workerId = SecurityService.workerId;
    String url = '${apiBaseUrl}Job/GetJobVisitModel/$jobVisitId/false/$workerId';
    return ConnectivityService.getData(url)
        .then((result) =>
          JobVisitModel.fromJson(JSONConverter.decode(result.body)));
  }
}