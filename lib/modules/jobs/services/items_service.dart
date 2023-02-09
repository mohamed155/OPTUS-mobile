import 'package:http/http.dart';
import 'package:tech2/config/app_config.dart';
import 'package:tech2/modules/jobs/models/items.dart';
import 'package:tech2/services/connectivity.dart';
import 'package:tech2/utilities/json_converter.dart';

class ItemsService {
  static Future<List<JobItemTaskCodesDto>> getJobItemTaskCodes(
      int jobId, bool isShowAll) {
    String url = '${apiBaseUrl}Job/GetJobItemTaskCodes/$jobId/$isShowAll';
    return ConnectivityService.getData(url).then((result) {
      dynamic body;
      if (result is Response) {
        body = result.body;
      } else if (result is String) {
        body = result;
      }
      return List.of(JSONConverter.decode(body))
          .map((item) => JobItemTaskCodesDto(item))
          .toList();
    });
  }

  static Future<List<JobItemTaskCodesDto>> getJobTypeItemByWorkerPermission(
      JobTypeItemByWorkerPermissionDto model) {
    String url = '${apiBaseUrl}Job/GetJobTypeItemByWorkerPermission';
    return ConnectivityService.getData(url, model).then((result) {
      dynamic body;
      if (result is Response) {
        body = result.body;
      } else if (result is String) {
        body = result;
      }
      return List.of(JSONConverter.decode(body))
          .map((item) => JobItemTaskCodesDto(item))
          .toList();
    });
  }

  static Future addTaskCodeItem(AddTaskCodeItemDto model) {
    String url = '${apiBaseUrl}Job/AddTaskCodeItem';
    return ConnectivityService.sendData(url, model);
  }

  static Future deleteTaskCodeItem(DeleteItemDto model) {
    String url = '${apiBaseUrl}Job/DeleteTaskCodeItem';
    return ConnectivityService.sendData(url, model);
  }
}
