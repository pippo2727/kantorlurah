import 'package:kantor_lurah/core/util/contextless/navigation.dart';
import 'package:kantor_lurah/core/widget/widget.dart';
import 'package:kantor_lurah/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AppDialog {
  static Future<bool?> confirm({
    required String title,
    required String message,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    IconData? icon,
    Color? iconColor,
    Color? confirmColor,
    bool barrierDismissible = true,
  }) {
    final context = Nav.navigatorKey.currentContext!;
    return showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: iconColor ?? Colors.blue),
              const SizedBox(width: 8),
            ],
            Expanded(child: Text(title, style: const TextStyle(fontSize: 18))),
          ],
        ),
        content: Text(message),
        actions: [
          QButton(
            label: cancelText,
            type: QButtonType.text,
            onPressed: () => Navigator.pop(context, false),
          ),
          QButton(
            label: confirmText,
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    );
  }

  static Future<void> info({
    required String title,
    required String message,
    String buttonText = 'OK',
    IconData? icon,
    Color? iconColor,
  }) {
    final context = Nav.navigatorKey.currentContext!;
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: iconColor ?? Colors.blue),
              const SizedBox(width: 8),
            ],
            Expanded(child: Text(title, style: const TextStyle(fontSize: 18))),
          ],
        ),
        content: Text(message),
        actions: [
          QButton(label: buttonText, onPressed: () => Navigator.pop(context)),
        ],
      ),
    );
  }

  static Future<void> success({
    required String title,
    required String message,
    String buttonText = 'OK',
  }) {
    return info(
      title: title,
      message: message,
      buttonText: buttonText,
      icon: Icons.check_circle,
      iconColor: Colors.green,
    );
  }

  static Future<bool?> warning({
    required String title,
    required String message,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
  }) {
    return confirm(
      title: title,
      message: message,
      confirmText: confirmText,
      cancelText: cancelText,
      icon: Icons.warning_amber_rounded,
      iconColor: Colors.orange,
      confirmColor: Colors.orange,
    );
  }

  static Future<bool?> danger({
    required String title,
    required String message,
    String confirmText = 'Delete',
    String cancelText = 'Cancel',
  }) {
    return confirm(
      title: title,
      message: message,
      confirmText: confirmText,
      cancelText: cancelText,
      icon: Icons.warning,
      iconColor: Colors.red,
      confirmColor: Colors.red,
    );
  }

  /// Show a premium-only feature dialog.
  /// Returns true if user tapped "Upgrade", false otherwise.
  /// Use this for menus/features that require Premium mode.
  static Future<bool> premiumOnly() async {
    final context = Nav.navigatorKey.currentContext!;
    final s = S.of(context)!;

    final result = await custom<bool>(
      title: s.premiumGate_title,
      icon: Icons.workspace_premium,
      iconColor: Colors.amber[700],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.lock_outline, size: 48, color: Colors.amber[700]),
          const SizedBox(height: 12),
          Text(
            s.premiumGate_message,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        QButton(
          label: s.common_later,
          type: QButtonType.text,
          onPressed: () => Nav.back(false),
        ),
        QButton(
          label: s.premiumGate_upgrade,
          icon: const Icon(Icons.workspace_premium, color: Colors.white),
          onPressed: () => Nav.back(true),
        ),
      ],
    );

    return result ?? false;
  }

  /// Show an order limit reached dialog.
  /// Returns true if user tapped "Upgrade", false otherwise.
  /// Use this for POS/PO menus when free mode order limit is exceeded.
  static Future<bool> orderLimitReached({
    required int maxOrders,
    required int currentOrders,
  }) async {
    final context = Nav.navigatorKey.currentContext!;
    final s = S.of(context)!;

    final result = await custom<bool>(
      title: s.orderLimit_title,
      icon: Icons.block,
      iconColor: Colors.red,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 48, color: Colors.red[300]),
          const SizedBox(height: 12),
          Text(
            s.orderLimit_message(maxOrders, currentOrders),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        QButton(
          label: s.common_later,
          type: QButtonType.text,
          onPressed: () => Nav.back(false),
        ),
        QButton(
          label: s.premiumGate_upgrade,
          icon: const Icon(Icons.workspace_premium, color: Colors.white),
          onPressed: () => Nav.back(true),
        ),
      ],
    );

    return result ?? false;
  }

  /// Show a custom dialog with any content
  static Future<T?> custom<T>({
    required String title,
    required Widget content,
    List<Widget>? actions,
    IconData? icon,
    Color? iconColor,
    bool barrierDismissible = true,
    bool scrollable = false,
  }) {
    final context = Nav.navigatorKey.currentContext!;
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: iconColor ?? Colors.blue),
              const SizedBox(width: 8),
            ],
            Expanded(child: Text(title, style: const TextStyle(fontSize: 18))),
          ],
        ),
        content: scrollable ? SingleChildScrollView(child: content) : content,
        actions: actions,
      ),
    );
  }

  /// Show a fullscreen dialog
  static Future<T?> fullscreen<T>({
    required String title,
    required Widget body,
    List<Widget>? actions,
  }) {
    final context = Nav.navigatorKey.currentContext!;
    return showDialog<T>(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog.fullscreen(
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Nav.back(),
            ),
            actions: actions,
          ),
          body: body,
        ),
      ),
    );
  }

  /// Show a selection dialog that returns the selected value
  static Future<T?> select<T>({
    required String title,
    required List<DialogOption<T>> options,
    IconData? icon,
    Color? iconColor,
    String cancelText = 'Cancel',
  }) {
    final context = Nav.navigatorKey.currentContext!;
    return showDialog<T>(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: iconColor ?? Colors.blue),
              const SizedBox(width: 8),
            ],
            Expanded(child: Text(title, style: const TextStyle(fontSize: 18))),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: options
              .map(
                (option) => ListTile(
                  leading: option.icon != null
                      ? Icon(option.icon, color: option.iconColor)
                      : null,
                  title: Text(option.title),
                  subtitle: option.subtitle != null
                      ? Text(option.subtitle!)
                      : null,
                  onTap: () => Navigator.pop(context, option.value),
                ),
              )
              .toList(),
        ),
        actions: [
          QButton(
            label: cancelText,
            type: QButtonType.text,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

/// Option item for selection dialog
class DialogOption<T> {
  final T value;
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Color? iconColor;

  const DialogOption({
    required this.value,
    required this.title,
    this.subtitle,
    this.icon,
    this.iconColor,
  });
}

/// Input field configuration for input dialog
class DialogInputField {
  final String label;
  final String? hint;
  final String? helperText;
  final String initialValue;
  final TextInputType keyboardType;
  final int maxLines;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final Widget? prefixIcon;
  final bool autofocus;

  const DialogInputField({
    required this.label,
    this.hint,
    this.helperText,
    this.initialValue = '',
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.maxLength,
    this.textCapitalization = TextCapitalization.none,
    this.prefixIcon,
    this.autofocus = true,
  });
}
