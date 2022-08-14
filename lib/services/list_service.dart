import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/extensions/extensions.dart';

import 'package:tech2/config/app_config.dart';
import 'package:tech2/models/list_dto.dart';
import 'package:tech2/services/http_interceptors.dart';
import 'package:tech2/services/connectivity.dart';
import 'package:tech2/services/storage.dart';
import 'package:tech2/utilities/json_converter.dart';

class ListService {
  static final _http = InterceptedHttp.build(interceptors: [APIInterceptors()]);

  static Future<List<ListDto<int, String>>> loadWorkerProjectRegionList(
      int workerId) {
    String url = '${apiBaseUrl}List/LoadWorkerProjectRegionList/$workerId';
    return ConnectivityService.checkConnectivity()
        .then((ConnectivityResult connectivityResult) {
      if (connectivityResult == ConnectivityResult.none) {
        return StorageService.retrieve(url);
      } else {
        return _http.get(url.toUri());
      }
    }).then((result) {
      if (result is Response) {
        print(result.body);
        return List.of(JSONConverter.decode(result.body))
            .map((item) => ListDto<int, String>.fromJSON(item))
            .toList();
      } else if (result is String) {
        return List.of(JSONConverter.decode(result))
            .map((item) => ListDto<int, String>.fromJSON(item))
            .toList();
      } else {
        return [];
      }
    });
  }

  static Future<List<ListDto<String, String>>> loadJobStatusList() {
    String url = '${apiBaseUrl}List/LoadJobStatusList';
    return ConnectivityService.checkConnectivity()
        .then((ConnectivityResult connectivityResult) {
      if (connectivityResult == ConnectivityResult.none) {
        return StorageService.retrieve(url);
      } else {
        return _http.get(url.toUri());
      }
    }).then((result) {
      if (result is Response) {
        return List.of(JSONConverter.decode(result.body))
            .map((item) => ListDto<String, String>.fromJSON(item))
            .toList();
      } else if (result is String) {
        return List.of(JSONConverter.decode(result))
            .map((item) => ListDto<String, String>.fromJSON(item))
            .toList();
      } else {
        return [];
      }
    });
  }
}
