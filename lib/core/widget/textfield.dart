import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kasir_baik/core/theme/theme.dart';

/// A text field widget that manages its own controller internally.
/// Use [initialValue] to set the initial value and [onChanged] to get value updates.
/// For number fields with [format: FieldFormat.thousandSeparator], the [onChanged]
/// callback returns the parsed numeric value (without formatting).
class QTextField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? prefixText;
  final String? Function(String?) validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  /// When provided, automatically shows a clear (X) icon as suffixIcon
  /// when the field is not empty. Tapping it clears the field and calls this callback.
  final VoidCallback? onClear;

  final int maxLines;
  final bool enabled;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;

  const QTextField({
    super.key,
    this.label,
    this.hint,
    this.initialValue,
    this.obscureText = false,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    required this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.maxLines = 1,
    this.enabled = true,
    this.readOnly = false,
    this.inputFormatters,
    this.focusNode,
    this.textInputAction,
    this.contentPadding,
  });

  @override
  State<QTextField> createState() => _QTextFieldState();
}

class _QTextFieldState extends State<QTextField> {
  late final TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    _hasText = _controller.text.isNotEmpty;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleChanged(String value) {
    if (widget.onClear != null) {
      final hasText = value.isNotEmpty;
      if (hasText != _hasText) {
        setState(() => _hasText = hasText);
      }
    }
    widget.onChanged?.call(value);
  }

  void _handleSubmitted(String value) {
    widget.onSubmitted?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    // Determine effective suffix icon
    Widget? effectiveSuffixIcon = widget.suffixIcon;
    if (widget.onClear != null && _hasText && effectiveSuffixIcon == null) {
      effectiveSuffixIcon = GestureDetector(
        onTap: () {
          _controller.clear();
          setState(() => _hasText = false);
          widget.onChanged?.call('');
          widget.onClear!();
        },
        child: Icon(
          Icons.clear,
          size: defaultFormFieldIconSize,
          color: Colors.grey[600],
        ),
      );
    }

    return TextFormField(
      controller: _controller,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      inputFormatters: widget.inputFormatters,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      style: TextStyle(
        fontSize: defaultFormFieldFontSize,
        color: widget.enabled ? null : Colors.grey,
      ),
      onChanged: _handleChanged,
      onFieldSubmitted: _handleSubmitted,
      validator: widget.validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: widget.label,
        hintText: widget.hint,
        prefixIcon: widget.prefixIcon != null
            ? IconTheme(
                data: IconThemeData(size: defaultFormFieldIconSize),
                child: widget.prefixIcon!,
              )
            : null,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 36,
          minHeight: 0,
        ),
        prefixText: widget.prefixText,
        prefixStyle: TextStyle(
          fontSize: defaultFormFieldFontSize,
          fontWeight: FontWeight.w500,
          color: widget.enabled ? null : Colors.grey,
        ),
        suffixIcon: effectiveSuffixIcon != null
            ? IconTheme(
                data: IconThemeData(size: defaultFormFieldIconSize),
                child: effectiveSuffixIcon,
              )
            : null,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 36,
          minHeight: 0,
        ),
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
        contentPadding:
            widget.contentPadding ??
            defaultFormWidgetPadding,
        isDense: true,
      ),
    );
  }
}
