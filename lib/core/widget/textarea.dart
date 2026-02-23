import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kantor_lurah/core/theme/theme.dart';

/// A multiline text area widget that manages its own controller internally.
/// Use [initialValue] to set the initial value and [onChanged] to get value updates.
class QTextArea extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final String? Function(String?) validator;
  final void Function(String)? onChanged;
  final int minLines;
  final int maxLines;
  final int? maxLength;
  final bool enabled;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  final bool showCounter;

  const QTextArea({
    super.key,
    this.label,
    this.hint,
    this.initialValue,
    required this.validator,
    this.onChanged,
    this.minLines = 2,
    this.maxLines = 5,
    this.maxLength,
    this.enabled = true,
    this.readOnly = false,
    this.inputFormatters,
    this.focusNode,
    this.textInputAction,
    this.contentPadding,
    this.showCounter = false,
  });

  @override
  State<QTextArea> createState() => _QTextAreaState();
}

class _QTextAreaState extends State<QTextArea> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 10),
        ],
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(formFieldRadius),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: TextFormField(
            controller: _controller,
            keyboardType: TextInputType.multiline,
            minLines: widget.minLines,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            enabled: widget.enabled,
            readOnly: widget.readOnly,
            inputFormatters: widget.inputFormatters,
            focusNode: widget.focusNode,
            textInputAction: widget.textInputAction ?? TextInputAction.newline,
            onChanged: widget.onChanged,
            validator: widget.validator,
            style: TextStyle(
              fontSize: defaultFormFieldFontSize,
              color: widget.enabled ? Colors.grey[800] : Colors.grey[400],
            ),
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: TextStyle(color: Colors.grey[400], fontSize: defaultFormFieldFontSize),
              border: InputBorder.none,
              contentPadding:
                  widget.contentPadding ??
                  defaultFormWidgetPadding,
              counterText: widget.showCounter ? null : '',
            ),
          ),
        ),
      ],
    );
  }
}
