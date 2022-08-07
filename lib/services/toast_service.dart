import 'package:flutter/material.dart';
import 'package:tech2/services/navigation_service.dart';

class ToastService {
  static void showSuccessMessage(String message) {
    BuildContext? cxt = NavigationService.navigationKey.currentContext;
    if (cxt != null) {
      ScaffoldMessenger.of(cxt).showSnackBar(SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ));
    }
  }

  static void showInfoMessage(String message) {
    BuildContext? cxt = NavigationService.navigationKey.currentContext;
    if (cxt != null) {
      ScaffoldMessenger.of(cxt).showSnackBar(SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ));
    }
  }

  static void showWarningMessage(String message) {
    BuildContext? cxt = NavigationService.navigationKey.currentContext;
    if (cxt != null) {
      ScaffoldMessenger.of(cxt).showSnackBar(SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.yellow,
      ));
    }
  }

  static void showErrorMessage(String message) {
    BuildContext? cxt = NavigationService.navigationKey.currentContext;
    if (cxt != null) {
      ScaffoldMessenger.of(cxt).showSnackBar(SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ));
    }
  }
}
