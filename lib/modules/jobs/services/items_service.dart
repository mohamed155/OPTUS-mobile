import 'package:tech2/config/app_config.dart';
import 'package:tech2/modules/jobs/models/items.dart';
import 'package:tech2/services/connectivity.dart';
import 'package:tech2/utilities/json_converter.dart';

class ItemsService {
  factory ItemsService() {
    return _instance;
  }

  ItemsService._create();

  static final _instance = ItemsService._create();

  Future<List<JobItemTaskCodesDto>> getJobItemTaskCodes(
    int jobId, {
    required bool isShowAll,
  }) {
    final url = '${apiBaseUrl}Job/GetJobItemTaskCodes/$jobId/$isShowAll';
    return ConnectivityService().getData(url).then((result) {
      return List.of(JSONConverter.decode(result.body) as Iterable<dynamic>)
          .map((item) => JobItemTaskCodesDto(item as Map<String, dynamic>))
          .toList();
    });
  }

  Future<List<JobItemTaskCodesDto>> getJobTypeItemByWorkerPermission(
    JobTypeItemByWorkerPermissionDto model,
  ) {
    const url = '${apiBaseUrl}Job/GetJobTypeItemByWorkerPermission';
    return ConnectivityService().getData(url, model).then((result) {
      return List.of(JSONConverter.decode(result.body) as Iterable<dynamic>)
          .map((item) => JobItemTaskCodesDto(item as Map<String, dynamic>))
          .toList();
    });
  }

  Future<void> addTaskCodeItem(AddTaskCodeItemDto model) {
    const url = '${apiBaseUrl}Job/AddTaskCodeItem';
    return ConnectivityService().sendData(url, model);
  }

  Future<void> deleteTaskCodeItem(DeleteItemDto model) {
    const url = '${apiBaseUrl}Job/DeleteTaskCodeItem';
    return ConnectivityService().sendData(url, model);
  }

  Future<void> saveJobItem(SaveJobItemDto model) {
    const url = '${apiBaseUrl}Job/UpdateJobItem';
    return ConnectivityService().sendData(url, model);
  }
}
