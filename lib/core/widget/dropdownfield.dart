import 'package:flutter/material.dart';
import 'package:kasir_baik/core/theme/theme.dart';

class QDropdownField<T> extends StatelessWidget {
  final String? label;
  final String? hint;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final String? Function(T?) validator;
  final bool enabled;
  final Widget? prefixIcon;

  const QDropdownField({
    super.key,
    this.label,
    this.hint,
    this.value,
    required this.items,
    this.onChanged,
    required this.validator,
    this.enabled = true,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      initialValue: value,
      items: items,
      onChanged: enabled ? onChanged : null,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
        hintText: hint,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(formFieldRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(formFieldRadius),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(formFieldRadius),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(formFieldRadius),
          borderSide: const BorderSide(color: dangerColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(formFieldRadius),
          borderSide: const BorderSide(color: dangerColor, width: 2),
        ),
        contentPadding: defaultFormWidgetPadding,
        isDense: true,
      ),
      isExpanded: true,
    );
  }

  /// Helper to create items from a list of objects
  static List<DropdownMenuItem<T>> buildItems<T>({
    required List<T> items,
    required String Function(T) labelBuilder,
    required T Function(T) valueBuilder,
  }) {
    return items.map((item) {
      return DropdownMenuItem<T>(
        value: valueBuilder(item),
        child: Text(labelBuilder(item)),
      );
    }).toList();
  }
}
