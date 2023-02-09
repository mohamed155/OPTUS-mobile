import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';
import 'package:tech2/modules/login/screens/index.dart';
import 'package:tech2/services/navigation_service.dart';
import 'package:tech2/services/security.dart';
import 'package:tech2/services/storage.dart';
import 'package:tech2/services/toast_service.dart';
import 'package:tech2/utilities/json_converter.dart';

class APIInterceptors extends InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      CognitoAuthSession session =
          await Amplify.Auth.fetchAuthSession() as CognitoAuthSession;
      // data.baseUrl = apiBaseUrl;
      JsonWebToken? idToken = session.userPoolTokensResult.value.idToken;
      data.headers["Authorization"] = "Bearer ${idToken.raw}";
      data.headers["Content-Type"] = "application/json";
      data.headers["Cache-Control"] = "no-cache";
      data.headers["Pragma"] = "no-cache";
    } catch (e) {
      if (kDebugMode) {
        print('request error $e');
      }
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print(data);
    switch (data.statusCode) {
      // success cases
      case 200:
        if (data.method == Method.GET) {
          StorageService.store(
              key: data.url.toString(), value: data.body.toString());
        }
        break;

      // error cases
      case 0:
        ToastService.showErrorMessage(
            "API is not running, please try again later");
        break;
      case 401:
        BuildContext? context = NavigationService.navigationKey.currentContext;
        if (context != null) {
          if (SecurityService.isUserSignedIn) {
            ToastService.showErrorMessage(
                "Session expired, please sign in again");
          } else {
            ToastService.showErrorMessage("Invalid username or password");
          }
          SecurityService.logout().then((_) => {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => const LoginScreen()),
                    ModalRoute.withName('/login'))
              });
        }
        break;
      case 403:
        ToastService.showErrorMessage(
            "You do not have the required permissions to perform this action.");
        break;
      case 400:
        if (data.body != null) {
          String body = data.body.toString();
          List<String> errors = [];
          Map<String, dynamic> validationErrorDictionary =
          JSONConverter.decode(body);
          errors.addAll(validationErrorDictionary.values
              .map((item) => item.toString())
              .toList());
          if (errors.isNotEmpty) {
            String error = errors.join("\n");
            ToastService.showErrorMessage(error);
          }
        }
        break;
      default:
        ToastService.showErrorMessage(
            "An error occurred please try again in few minutes.For further help please contact our customer support.");
    }
    return data;
  }
}
