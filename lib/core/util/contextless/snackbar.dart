import 'package:kasir_baik/core/util/contextless/navigation.dart';
import 'package:flutter/material.dart';

class AppSnackbar {
  static void show({
    required String message,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
    Color? backgroundColor,
    Color? textColor,
  }) {
    final context = Nav.navigatorKey.currentContext!;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: textColor ?? Colors.white),
        ),
        duration: duration,
        action: action,
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  static void success(String message) {
    show(message: message, backgroundColor: Colors.green);
  }

  static void error(String message) {
    show(message: message, backgroundColor: Colors.red);
  }

  static void warning(String message) {
    show(message: message, backgroundColor: Colors.orange);
  }

  static void info(String message) {
    show(message: message, backgroundColor: Colors.blue);
  }

  static void withAction({
    required String message,
    required String actionLabel,
    required VoidCallback onAction,
    Color? backgroundColor,
  }) {
    show(
      message: message,
      backgroundColor: backgroundColor,
      action: SnackBarAction(
        label: actionLabel,
        textColor: Colors.white,
        onPressed: onAction,
      ),
    );
  }
}
