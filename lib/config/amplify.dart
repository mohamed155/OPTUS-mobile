import 'package:flutter/foundation.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

import 'package:tech2/config/amplify_configuration.dart';

class AmplifyConfiguration {

  static Future<void> configureAmplify() {
      return Amplify.addPlugin(AmplifyAuthCognito())
          .then((value) => Amplify.configure(amplifyConfig))
          .catchError((error) {
            if (kDebugMode) {
              print(error);
            }
          });
  }
}