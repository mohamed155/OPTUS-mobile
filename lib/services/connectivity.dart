import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  static Future<ConnectivityResult> checkConnectivity() {
    return Connectivity().checkConnectivity();
  }
}