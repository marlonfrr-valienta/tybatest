import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> pushReplacementNamed(String routeName, {Map<String, String>? initRedirectPayload}) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: initRedirectPayload);
  }
}
