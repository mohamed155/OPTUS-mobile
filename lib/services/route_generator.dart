import 'package:flutter/material.dart';

import 'package:tech2/services/security.dart';
import 'package:tech2/modules/login/screens/index.dart';
import 'package:tech2/widgets/hidden_drawer.dart';

class RouteGenerator {

  static Route<MaterialPageRoute> generateRoute(RouteSettings settings) {
    late Widget screen;
    if (SecurityService.isUserSignedIn) {
      switch (settings.name) {
        case '/':
          screen = const HiddenDrawer();
          break;
      }
    } else {
      screen = const LoginScreen();
    }

    return MaterialPageRoute(builder: (context) => screen);
  }
}
