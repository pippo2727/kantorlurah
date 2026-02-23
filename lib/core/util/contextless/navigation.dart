import 'package:flutter/material.dart';

class Nav {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<T?> to<T extends Object?>(Widget page) async {
    return await navigatorKey.currentState!.push<T>(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static Future<T?> off<T extends Object?>(Widget page) async {
    return await navigatorKey.currentState!.pushReplacement<T, void>(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static Future<T?> offAll<T extends Object?>(Widget page) async {
    return await navigatorKey.currentState!.pushAndRemoveUntil<T>(
      MaterialPageRoute(builder: (context) => page),
      (route) => false,
    );
  }

  static void back<T extends Object?>([T? result]) {
    navigatorKey.currentState!.pop(result);
  }
}
