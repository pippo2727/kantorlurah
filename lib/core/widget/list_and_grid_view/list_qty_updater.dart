import 'package:kasir_baik/core/theme/theme.dart';
import 'package:kasir_baik/core/widget/qty_picker.dart';
import 'package:flutter/material.dart';

/// A reusable trailing widget for list views that shows:
/// - QtyPicker (compact) when item is in cart (value != 0)
/// - Add to cart IconButton when item is not in cart
/// - SizedBox.shrink when item is unavailable
class ListQtyUpdater extends StatelessWidget {
  /// Current quantity in cart. Shows QtyPicker when != 0, add button when 0.
  final double value;

  /// Minimum allowed value (default: 0). Use negative for stock adjustment.
  final double min;

  /// Maximum allowed value. Null means no limit.
  final double? max;

  /// Increment/decrement step (default: 1).
  final double step;

  /// Whether decimal values are allowed.
  final bool allowDecimal;

  /// Whether the product is available for adding. When false and value is 0,
  /// shows nothing (SizedBox.shrink).
  final bool isAvailable;

  /// Callback when quantity changes via QtyPicker.
  final ValueChanged<double> onChanged;

  /// Callback when add button is pressed. If null, uses a no-op.
  final VoidCallback? onAdd;

  /// Size of the compact QtyPicker buttons (default: 28).
  final double compactSize;

  /// Color of the add button icon (default: primaryColor).
  final Color? addIconColor;

  /// Icon for the add button (default: Icons.add_shopping_cart).
  final IconData addIcon;

  const ListQtyUpdater({
    super.key,
    required this.value,
    required this.onChanged,
    this.onAdd,
    this.min = 0,
    this.max,
    this.step = 1,
    this.allowDecimal = false,
    this.isAvailable = true,
    this.compactSize = 28,
    this.addIconColor,
    this.addIcon = Icons.add_shopping_cart,
  });

  @override
  Widget build(BuildContext context) {
    if (value != 0) {
      return QtyPicker(
        type: QtyPickerType.compact,
        value: value,
        min: min,
        max: max,
        step: step,
        allowDecimal: allowDecimal,
        compactSize: compactSize,
        onChanged: onChanged,
      );
    }

    if (!isAvailable) {
      return const SizedBox.shrink();
    }

    return IconButton(
      onPressed: onAdd,
      icon: Icon(addIcon),
      color: addIconColor ?? primaryColor,
    );
  }
}
