import 'package:http/http.dart';
import 'package:tech2/config/app_config.dart';
import 'package:tech2/models/list_dto.dart';
import 'package:tech2/services/connectivity.dart';
import 'package:tech2/utilities/json_converter.dart';

class ListService {
  factory ListService() {
    return _instance;
  }

  ListService._create();

  static final ListService _instance = ListService._create();

  List<ListDto<K, V>> _parseListData<K, V>(Response result) {
    return List.of(JSONConverter.decode(result.body) as Iterable<dynamic>)
        .map((item) => ListDto<K, V>.fromJSON(item as Map<String, dynamic>))
        .toList();
  }

  Future<List<ListDto<int, String>>> loadWorkerProjectRegionList(
    int workerId,
  ) {
    final url = '${apiBaseUrl}List/LoadWorkerProjectRegionList/$workerId';
    return ConnectivityService().getData(url).then(_parseListData<int, String>);
  }

  Future<List<ListDto<String, String>>> loadJobStatusList() {
    const url = '${apiBaseUrl}List/LoadJobStatusList';
    return ConnectivityService()
        .getData(url)
        .then(_parseListData<String, String>);
  }

  Future<List<ListDto<int, String>>> loadSubRegionListByProjectRegionId(
    List<int> projectRegionIds,
  ) {
    final url =
        '${apiBaseUrl}List/LoadSubRegionListByProjectRegionId?projectRegionIds=${projectRegionIds.join(",")}';
    return ConnectivityService().getData(url).then(_parseListData<int, String>);
  }
}
