import 'package:flutter/material.dart';

class NavigationService {
  factory NavigationService() {
    return _instance;
  }

  NavigationService._create();

  static final _instance = NavigationService._create();

  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
}
