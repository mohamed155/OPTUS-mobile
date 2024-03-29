import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tech2/services/security.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = '';
  String password = '';
  bool isLoading = false;
  bool showPassword = false;

  Future<void> login() async {
    if (!isLoading) {
      setState(() => isLoading = true);
      unawaited(
        SecurityService()
            .login(username: username, password: password)
            .then((_) async {
              if (SecurityService.isUserSignedIn) {
                return SecurityService().getAppUser();
              }
            })
            .then(
              (_) => Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (route) => false,
              ),
            )
            .whenComplete(() => setState(() => isLoading = false)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    InputDecoration inputDecoration({
      required String labelText,
      bool? obscure,
    }) {
      final textFieldBorder = OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).primaryColor),
      );

      return InputDecoration(
        label: Text(labelText),
        labelStyle: const TextStyle(color: Colors.white),
        border: textFieldBorder,
        enabledBorder: textFieldBorder,
        focusedBorder: textFieldBorder,
        suffix: obscure != null
            ? Transform.translate(
                offset: const Offset(0, 4),
                child: IconButton(
                  onPressed: () => setState(() => showPassword = !obscure),
                  icon: Icon(
                    obscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white,
                  ),
                ),
              )
            : null,
      );
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 1,
            colors: [
              Colors.black87,
              Colors.black,
            ],
            stops: [0.1, 10],
          ),
        ),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/logo-o.png'),
              width: 300,
            ),
            const SizedBox(
              height: 60,
            ),
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: inputDecoration(labelText: 'Username'),
              onChanged: (value) => setState(() => username = value),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 57,
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: inputDecoration(
                  labelText: 'Password',
                  obscure: showPassword,
                ),
                obscureText: !showPassword,
                enableSuggestions: false,
                autocorrect: false,
                onChanged: (value) => setState(() => password = value),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: isLoading ? null : login,
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
                            ),
                          ]
                        : [],
                    const Text('Login'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
