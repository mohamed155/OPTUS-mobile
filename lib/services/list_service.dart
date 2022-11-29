import 'package:http/http.dart';

import 'package:tech2/config/app_config.dart';
import 'package:tech2/models/list_dto.dart';
import 'package:tech2/services/connectivity.dart';
import 'package:tech2/utilities/json_converter.dart';

class ListService {
  static List<ListDto<K, V>> _parseListData<K, V>(result) {
    if (result is Response) {
      return List.of(JSONConverter.decode(result.body))
          .map((item) => ListDto<K, V>.fromJSON(item))
          .toList();
    } else if (result is String) {
      return List.of(JSONConverter.decode(result))
          .map((item) => ListDto<K, V>.fromJSON(item))
          .toList();
    } else {
      return [];
    }
  }

  static Future<List<ListDto<int, String>>> loadWorkerProjectRegionList(
      int workerId) {
    String url = '${apiBaseUrl}List/LoadWorkerProjectRegionList/$workerId';
    return ConnectivityService.getData(url).then(_parseListData<int, String>);
  }

  static Future<List<ListDto<String, String>>> loadJobStatusList() {
    String url = '${apiBaseUrl}List/LoadJobStatusList';
    return ConnectivityService.getData(url).then(_parseListData<String, String>);
  }

  static Future<List<ListDto<int, String>>> loadSubRegionListByProjectRegionId(List<int> projectRegionIds) {
    String url = '${apiBaseUrl}List/LoadSubRegionListByProjectRegionId?projectRegionIds=${projectRegionIds.join(",")}';
    return ConnectivityService.getData(url).then(_parseListData<int, String>);
  }
}
