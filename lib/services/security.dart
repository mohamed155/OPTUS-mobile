import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/extensions/extensions.dart';
import 'package:http_interceptor/http/http.dart';

import 'package:tech2/config/app_config.dart';
import 'package:tech2/services/http_interceptors.dart';
import 'package:tech2/services/navigation_service.dart';
import 'package:tech2/services/storage.dart';
import 'package:tech2/services/toast_service.dart';
import 'package:tech2/utilities/json_converter.dart';

class SecurityService {
  static bool isUserSignedIn = false;
  static int _workerId = 0;
  static String _workerName = "";

  static int get workerId {
    if (_workerId == 0) {
      String? workerIdString = StorageService.retrieve('workerId');
      if (workerIdString != null) {
        return int.parse(workerIdString);
      }
    }
    return _workerId;
  }

  static String get workerName {
    if (_workerName == "") {
      String? workerNameString = StorageService.retrieve('workerName');
      if (workerNameString != null) _workerName = workerNameString;
    }
    return _workerName;
  }

  static Future<void> login({
      required String username,
      required String password
  }) async {
    if (username.isNotEmpty && password.isNotEmpty) {
      try {
        SignInResult res =
          await Amplify.Auth.signIn(username: username, password: password);
        isUserSignedIn = res.isSignedIn;
      } on NotAuthorizedException catch(_) {
        ToastService.showErrorMessage("Invalid username or password");
      }
    } else {
      ToastService.showErrorMessage("Username and password are required");
    }
  }

  static Future<void> logout() {
    return Amplify.Auth.signOut()
        .then((_) {
          SecurityService.isUserSignedIn = false;
          return StorageService.clear();
        }).then((_) {
      BuildContext? context = NavigationService.navigationKey.currentContext;
      if (context != null) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/login', (route) => false);
      }
    });
  }

  static Future<void> getAppUser() {
    InterceptedHttp http = InterceptedHttp.build(interceptors: [APIInterceptors()]);
    Uri uri = '${apiBaseUrl}Security/GetApplicationUser'.toUri();
    return http.get(uri)
        .then((Response res) => JSONConverter.decode(res.body))
        .then((body) async {
          _workerId = body['workerId'];
          _workerName = body['workerName'];
          await StorageService.store(key: 'workerId', value: _workerId.toString());
          await StorageService.store(key: 'workerName', value: _workerName);
        });
  }
}
