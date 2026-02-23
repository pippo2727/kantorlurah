import 'package:flutter/material.dart';
import 'package:kantor_lurah/core/theme/theme.dart';

enum QButtonType { primary, secondary, danger, text }

class QButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final QButtonType type;
  final bool isLoading;
  final bool isExpanded;
  final Widget? icon;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const QButton({
    super.key,
    required this.label,
    this.onPressed,
    this.type = QButtonType.primary,
    this.isLoading = false,
    this.isExpanded = false,
    this.icon,
    this.height,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final button = _buildButton(context);

    if (isExpanded) {
      return SizedBox(
        width: double.infinity,
        height: height ?? 48,
        child: button,
      );
    }

    return button;
  }

  Widget _buildButton(BuildContext context) {
    final child = isLoading
        ? const SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : icon != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon!,
              const SizedBox(width: 8),
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(label, maxLines: 1, textAlign: TextAlign.center),
                ),
              ),
            ],
          )
        : FittedBox(fit: BoxFit.scaleDown, child: Text(label, maxLines: 1));

    switch (type) {
      case QButtonType.primary:
        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(formFieldRadius),
            ),
          ),
          child: child,
        );

      case QButtonType.secondary:
        return OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(formFieldRadius),
            ),
          ),
          child: child,
        );

      case QButtonType.danger:
        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: dangerColor,
            foregroundColor: Colors.white,
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(formFieldRadius),
            ),
          ),
          child: child,
        );

      case QButtonType.text:
        return TextButton(
          onPressed: isLoading ? null : onPressed,
          style: TextButton.styleFrom(
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(formFieldRadius),
            ),
          ),
          child: child,
        );
    }
  }
}
