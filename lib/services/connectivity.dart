import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http_interceptor/extensions/extensions.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:tech2/interfaces/has_map.dart';
import 'package:tech2/services/http_interceptors.dart';
import 'package:tech2/services/storage.dart';
import 'package:tech2/utilities/json_converter.dart';

class ConnectivityService {
  static final _http = InterceptedHttp.build(interceptors: [APIInterceptors()]);

  static Future<ConnectivityResult> checkConnectivity() {
    return Connectivity().checkConnectivity();
  }

  static Future getData(String url, [Mappable? params]) {
    return ConnectivityService.checkConnectivity()
        .then((ConnectivityResult connectivityResult) {
      if (connectivityResult == ConnectivityResult.none) {
        return StorageService.retrieve(url);
      } else {
        if (params != null) {
          return _http.get(url.toUri(), params: params.toMap());
        } else {
          return _http.get(url.toUri());
        }
      }
    });
  }

  static Future sendData(String url, [Mappable? body]) {
    return ConnectivityService.checkConnectivity()
        .then((ConnectivityResult connectivityResult) {
      if (connectivityResult == ConnectivityResult.none) {
        return StorageService.store(
            key: 'post_requests', value: '$url?${body?.toMap().toString()}');
      } else {
        if (body != null) {
          var json = JSONConverter.encode(body.toMap());
          return _http.post(url.toUri(), body: json);
        } else {
          return _http.post(url.toUri());
        }
      }
    });
  }
}
