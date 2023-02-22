import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';
import 'package:tech2/services/navigation_service.dart';
import 'package:tech2/services/security.dart';
import 'package:tech2/services/toast_service.dart';
import 'package:tech2/utilities/json_converter.dart';

class APIInterceptors extends InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      final session =
          await Amplify.Auth.fetchAuthSession() as CognitoAuthSession;
      // data.baseUrl = apiBaseUrl;
      final idToken = session.userPoolTokensResult.value.idToken;
      data.headers['Authorization'] = 'Bearer ${idToken.raw}';
      data.headers['Content-Type'] = 'application/json';
      data.headers['Cache-Control'] = 'no-cache';
      data.headers['Pragma'] = 'no-cache';
    } on AuthException {
      ToastService.showErrorMessage(
        'Authentication error',
      );
    } on AmplifyException {
      ToastService.showErrorMessage(
        'You do not have the required permissions to perform this action.',
      );
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    switch (data.statusCode) {
      // error cases
      case 0:
        ToastService.showErrorMessage(
          'API is not running, please try again later',
        );
        break;
      case 401:
        final context = NavigationService().navigationKey.currentContext;
        if (context != null) {
          if (SecurityService.isUserSignedIn) {
            ToastService.showErrorMessage(
              'Session expired, please sign in again',
            );
          } else {
            ToastService.showErrorMessage('Invalid username or password');
          }
          await SecurityService().logout();
        }
        break;
      case 403:
        ToastService.showErrorMessage(
          'You do not have the required permissions to perform this action.',
        );
        break;
      case 400:
        if (data.body != null) {
          final body = data.body.toString();
          final errors = List<String>.empty();
          final validationErrorDictionary =
              JSONConverter.decode(body) as Map<String, dynamic>;
          errors.addAll(
            validationErrorDictionary.values
                .map((item) => item.toString())
                .toList(),
          );
          if (errors.isNotEmpty) {
            final error = errors.join('\n');
            ToastService.showErrorMessage(error);
          }
        }
        break;
      default:
        ToastService.showErrorMessage(
            'An error occurred please try again in few minutes.For further help'
            ' please contact our customer support.');
    }
    return data;
  }
}
