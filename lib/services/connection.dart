import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/extensions/extensions.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:tech2/interfaces/has_map.dart';
import 'package:tech2/services/http_interceptors.dart';
import 'package:tech2/utilities/json_converter.dart';

class ConnectionService {
  factory ConnectionService() {
    return _instance;
  }

  ConnectionService._create();

  static final ConnectionService _instance = ConnectionService._create();

  final _http = InterceptedHttp.build(interceptors: [APIInterceptors()]);

  static Future<ConnectivityResult> checkConnectivity() {
    return Connectivity().checkConnectivity();
  }

  Future<Response> getData(String url, [Mappable? params]) {
    if (params != null) {
      return _http.get(url.toUri(), params: params.toMap());
    } else {
      return _http.get(url.toUri());
    }
  }

  Future<Response> postData(String url, [Mappable? body]) {
    if (body != null) {
      late final String json;
      if (body is MappableList) {
        json = JSONConverter().encode(body.toMapList());
      } else {
        json = JSONConverter().encode(body.toMap());
      }
      return _http.post(url.toUri(), body: json);
    } else {
      return _http.post(url.toUri());
    }
  }

  Future<Response> putData(String url, [Mappable? body]) {
    if (body != null) {
      late final String json;
      if (body is MappableList) {
        json = JSONConverter().encode(body.toMapList());
      } else {
        json = JSONConverter().encode(body.toMap());
      }
      return _http.put(url.toUri(), body: json);
    } else {
      return _http.put(url.toUri());
    }
  }

  Future<Response> deleteData(String url) {
    return _http.delete(url.toUri());
  }
}
