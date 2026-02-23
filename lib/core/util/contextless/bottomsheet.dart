import 'package:flutter/material.dart';
import 'package:kantor_lurah/core/util/contextless/navigation.dart';
import 'package:kantor_lurah/core/widget/widget.dart';

/// Contextless utility for showing bottom sheets.
/// Use this instead of calling showModalBottomSheet directly.
class AppBottomSheet {
  /// Show a filter bottom sheet with the entire content as a builder.
  /// Use StatefulBuilder within the builder to manage local state.
  /// Returns the result from the sheet.
  static Future<T?> show<T>({
    required Widget Function(BuildContext context) builder,
    bool isScrollControlled = true,
    bool isDismissible = true,
    bool enableDrag = true,
  }) async {
    final context = Nav.navigatorKey.currentContext;
    if (context == null) return null;

    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: builder,
    );
  }

  /// Show a filter bottom sheet with dropdowns and apply button.
  /// Returns the result from onApply callback.
  static Future<T?> filter<T>({
    required String title,
    required Widget Function(BuildContext context, StateSetter setModalState)
    builder,
    required VoidCallback onApply,
    VoidCallback? onReset,
    String applyText = 'Apply Filter',
    String resetText = 'Reset',
  }) async {
    final context = Nav.navigatorKey.currentContext;
    if (context == null) return null;

    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with Reset
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (onReset != null)
                          TextButton(
                            onPressed: () {
                              onReset();
                              setModalState(() {});
                            },
                            child: Text(resetText),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Custom content
                    builder(context, setModalState),

                    const SizedBox(height: 24),

                    // Apply Button
                    SizedBox(
                      width: double.infinity,
                      child: QButton(
                        label: applyText,
                        onPressed: () {
                          onApply();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  /// Show a details bottom sheet with draggable scrollable content.
  static Future<T?> details<T>({
    required String title,
    String? subtitle,
    required Widget Function(
      BuildContext context,
      ScrollController scrollController,
    )
    builder,
    Color? headerColor,
    IconData? headerIcon,
    double initialChildSize = 0.7,
    double minChildSize = 0.4,
    double maxChildSize = 0.95,
    Widget? footer,
  }) async {
    final context = Nav.navigatorKey.currentContext;
    if (context == null) return null;

    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: initialChildSize,
        minChildSize: minChildSize,
        maxChildSize: maxChildSize,
        expand: false,
        builder: (context, scrollController) => Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: headerColor ?? Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  if (headerIcon != null) ...[
                    Icon(headerIcon, color: Colors.white, size: 28),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        if (subtitle != null)
                          Text(
                            subtitle,
                            style: const TextStyle(color: Colors.white70),
                          ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(child: builder(context, scrollController)),

            // Footer
            if (footer != null)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.2),
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: SafeArea(child: footer),
              ),
          ],
        ),
      ),
    );
  }

  /// Show a simple bottom sheet with custom content.
  static Future<T?> custom<T>({
    required Widget child,
    bool isScrollControlled = true,
    bool isDismissible = true,
    bool enableDrag = true,
    Color? backgroundColor,
  }) async {
    final context = Nav.navigatorKey.currentContext;
    if (context == null) return null;

    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => child,
    );
  }

  /// Show a bottom sheet with options/actions.
  /// Similar to showMenuSheet but with more customization.
  static Future<T?> options<T>({
    String? title,
    String? subtitle,
    Widget? leading,
    required List<BottomSheetOption<T>> options,
  }) async {
    final context = Nav.navigatorKey.currentContext;
    if (context == null) return null;

    return showModalBottomSheet<T>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),

              // Header
              if (title != null || leading != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      if (leading != null) ...[
                        leading,
                        const SizedBox(width: 12),
                      ],
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (title != null)
                              Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            if (subtitle != null)
                              Text(
                                subtitle,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 13,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              if (title != null || leading != null) ...[
                const SizedBox(height: 8),
                const Divider(),
              ],

              // Options
              ...options.map(
                (option) => ListTile(
                  leading: option.icon != null
                      ? Icon(option.icon, color: option.color)
                      : null,
                  title: Text(
                    option.label,
                    style: TextStyle(color: option.color),
                  ),
                  subtitle: option.subtitle != null
                      ? Text(option.subtitle!)
                      : null,
                  enabled: option.enabled,
                  onTap: () {
                    Navigator.pop(context, option.value);
                    option.onTap?.call();
                  },
                ),
              ),

              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

/// Option item for bottom sheet options.
class BottomSheetOption<T> {
  final T? value;
  final String label;
  final String? subtitle;
  final IconData? icon;
  final Color? color;
  final bool enabled;
  final VoidCallback? onTap;

  const BottomSheetOption({
    this.value,
    required this.label,
    this.subtitle,
    this.icon,
    this.color,
    this.enabled = true,
    this.onTap,
  });
}
