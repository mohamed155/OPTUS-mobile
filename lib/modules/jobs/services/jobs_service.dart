import 'dart:async';

import 'package:tech2/config/app_config.dart';
import 'package:tech2/modules/jobs/models/bulk_routing_parameters.dart';
import 'package:tech2/modules/jobs/models/bulk_routing_result.dart';
import 'package:tech2/modules/jobs/models/job_form_item.dart';
import 'package:tech2/modules/jobs/models/job_status.dart';
import 'package:tech2/modules/jobs/models/job_visit_model.dart';
import 'package:tech2/services/connection.dart';
import 'package:tech2/services/security.dart';
import 'package:tech2/utilities/json_converter.dart';

class JobsService {
  factory JobsService() {
    return _instance;
  }

  JobsService._create();

  static final _instance = JobsService._create();

  Future<List<BulkRoutingResult>> getListOfBulkRoutingJobs(
    BulkRoutingParameters model,
  ) {
    const url = '${apiBaseUrl}BulkRouting/GetListOfBulkRoutingJobs';
    return ConnectionService().getData(url, model).then((result) {
      return List.of(
        (JSONConverter().decode(result.body) as Map<String, dynamic>)['data']
            as Iterable<dynamic>,
      )
          .map(
            (item) => BulkRoutingResult.fromJson(item as Map<String, dynamic>),
          )
          .toList();
    });
  }

  Future<List<BulkRoutingResult>> getListOfBulkRoutingJobsForWorker(
    BulkRoutingParametersForWorker model,
  ) {
    const url = '${apiBaseUrl}BulkRouting/GetListOfBulkRoutingJobsForWorker';
    return ConnectionService().getData(url, model).then((result) {
      return List.of(
        (JSONConverter().decode(result.body) as Map<String, dynamic>)['data']
            as Iterable<dynamic>,
      )
          .map(
            (item) => BulkRoutingResult.fromJson(item as Map<String, dynamic>),
          )
          .toList();
    });
  }

  Future<JobVisitModel> getJobVisitModel(int jobVisitId) {
    final workerId = SecurityService.workerId;
    final url = '${apiBaseUrl}Job/GetJobVisitModel/$jobVisitId/false/$workerId';
    final completer = Completer<JobVisitModel>();
    ConnectionService().getData(url).then(
      (result) {
        if (result.statusCode == 403) {
          completer.completeError('Forbidden');
        } else {
          completer.complete(
            JobVisitModel(
              JSONConverter().decode(result.body) as Map<String, dynamic>,
            ),
          );
        }
      },
    );
    return completer.future;
  }

  Future<List<JobFormDto>> getJobForms(int jobVisitId) {
    final url = '${apiBaseUrl}JobForm/GetJobForms/$jobVisitId';
    return ConnectionService().getData(url).then(
          (result) =>
              List.of(JSONConverter().decode(result.body) as Iterable<dynamic>)
                  .map(
                    (formJson) =>
                        JobFormDto.fromJson(formJson as Map<String, dynamic>),
                  )
                  .toList(),
        );
  }

  Future<JobStatusDto> getJobStatusInfo(int jobStatusId) {
    final url = '${apiBaseUrl}Job/GetJobStatusInfo/$jobStatusId';
    return ConnectionService().getData(url).then(
          (result) => JobStatusDto(
            JSONConverter().decode(result.body) as Map<String, dynamic>,
          ),
        );
  }

  Future<void> updateJobVisit(JobVisitModel model) {
    const url = '${apiBaseUrl}Job/UpdateJobVisit';
    return ConnectionService().putData(url, model);
  }
}
