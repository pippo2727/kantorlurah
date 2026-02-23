import 'package:flutter/material.dart';
import 'package:kantor_lurah/core/theme/theme.dart';

/// Reusable switch tile widget with consistent styling.
///
/// Wraps a switch control with title, subtitle, and icon in a styled container.
/// Uses theme constants for font size, icon size, and border radius.
///
/// Usage:
/// ```dart
/// QSwitchTile(
///   title: 'Track Stock',
///   subtitle: isEnabled ? 'Stock will be tracked' : 'Tap to enable',
///   value: isEnabled,
///   onChanged: (v) => setState(() => isEnabled = v),
///   icon: Icons.inventory_2,
///   activeColor: Colors.green,
/// )
/// ```
class QSwitchTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final IconData? icon;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? backgroundColor;

  const QSwitchTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.value,
    this.onChanged,
    this.icon,
    this.activeColor,
    this.inactiveColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveActiveColor = activeColor ?? primaryColor;
    final effectiveInactiveColor = inactiveColor ?? Colors.grey;
    final effectiveBgColor = backgroundColor ?? Colors.grey[100];

    return Container(
      decoration: BoxDecoration(
        color: effectiveBgColor,
        borderRadius: BorderRadius.circular(formFieldRadius),
      ),
      padding: defaultFormWidgetPadding,
      child: Row(
        children: [
          // Icon
          if (icon != null) ...[
            Icon(
              icon,
              size: defaultFormFieldFontSize + 4,
              color: value ? effectiveActiveColor : effectiveInactiveColor,
            ),
            const SizedBox(width: 12),
          ],
          // Title + Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: defaultFormFieldFontSize,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle!,
                    style: TextStyle(
                      fontSize: defaultFormFieldFontSize - 2,
                      color: value
                          ? effectiveActiveColor
                          : effectiveInactiveColor,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Switch
          Transform.scale(
            scale: 0.8,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeThumbColor: effectiveActiveColor,
            ),
          ),
        ],
      ),
    );
  }
}
