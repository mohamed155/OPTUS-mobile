import 'package:http_interceptor/http/http.dart';
import 'package:tech2/services/http_interceptors.dart';

class JobsService {
  final _http = InterceptedHttp.build(interceptors: [APIInterceptors()]);

  
}