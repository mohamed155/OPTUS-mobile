import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

import 'package:tech2/config/amplify.dart';
import 'package:tech2/services/navigation_service.dart';
import 'package:tech2/services/route_generator.dart';
import 'package:tech2/services/security.dart';
import 'package:tech2/services/storage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // This widget is the root of your application.

  bool appInitialized = false;

  @override
  initState() {
    super.initState();
    AmplifyConfiguration.configureAmplify()
        .then((_) => Amplify.Auth.fetchAuthSession())
        .then((AuthSession session) =>
            SecurityService.isUserSignedIn = session.isSignedIn)
        .then((_) => StorageService.init())
        .then((_) => setState(() => appInitialized = true));
  }

  @override
  Widget build(BuildContext context) {
    if (appInitialized) {
      return MaterialApp(
        title: 'Tech2',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        navigatorKey: NavigationService.navigationKey,
      );
    } else {
      return const Center(
        child: SizedBox(
          width: 90,
          height: 90,
          child: SizedBox.expand(
            child: CircularProgressIndicator(
              strokeWidth: 5,
              color: Colors.red,
            ),
          ),
        ),
      );
    }
  }
}
