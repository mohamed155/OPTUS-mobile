import 'package:flutter/material.dart';
import 'package:tech2/services/navigation_service.dart';

class ToastService {
  factory ToastService() {
    return _instance;
  }

  ToastService._create();

  static final ToastService _instance = ToastService._create();

  void showSuccessMessage(String message) {
    final cxt = NavigationService().navigationKey.currentContext;
    if (cxt != null) {
      ScaffoldMessenger.of(cxt).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  void showInfoMessage(String message) {
    final cxt = NavigationService().navigationKey.currentContext;
    if (cxt != null) {
      ScaffoldMessenger.of(cxt).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
      );
    }
  }

  void showWarningMessage(String message) {
    final cxt = NavigationService().navigationKey.currentContext;
    if (cxt != null) {
      ScaffoldMessenger.of(cxt).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.yellow,
        ),
      );
    }
  }

  static void showErrorMessage(String message) {
    final cxt = NavigationService().navigationKey.currentContext;
    if (cxt != null) {
      ScaffoldMessenger.of(cxt).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
