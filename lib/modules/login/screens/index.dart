import 'package:flutter/material.dart';

import 'package:tech2/services/security.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = '';
  String password = '';
  bool isLoading = false;

  login() async {
    if (!isLoading) {
      setState(() => isLoading = true);
      SecurityService.login(username: username, password: password)
          .then((_) async {
        if (SecurityService.isUserSignedIn) {
          return SecurityService.getAppUser();
        }
      })
          .then((_) =>
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false))
          .whenComplete(() => setState(() => isLoading = false));
    }
  }

  @override
  Widget build(BuildContext context) {
    inputDecoration({required String labelText}) {
      OutlineInputBorder textFieldBorder = OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor));

      return InputDecoration(
        label: Text(labelText),
        labelStyle: const TextStyle(color: Colors.white),
        border: textFieldBorder,
        enabledBorder: textFieldBorder,
        focusedBorder: textFieldBorder,
      );
    }

    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(radius: 1, colors: [
              Colors.black87,
              Colors.black,
            ], stops: [
              0.1,
              10
            ]),
          ),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage("assets/images/logo.png"),
                width: 300,
              ),
              const SizedBox(
                height: 60,
              ),
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: inputDecoration(labelText: "Username"),
                onChanged: (value) => setState(() => username = value),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: inputDecoration(labelText: "Password"),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                onChanged: (value) => setState(() => password = value),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                    onPressed: login,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...isLoading
                            ? [
                                const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 3,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                )
                              ]
                            : [],
                        const Text("Login"),
                      ],
                    )),
              )
            ],
          ),
    ));
  }
}
