import 'package:flutter/material.dart';

/// Type of QtyPicker layout
enum QtyPickerType {
  /// Full width with container border (for forms)
  fullWidth,

  /// Compact inline style (for lists/carts)
  compact,
}

/// A quantity picker widget with +/- buttons and editable text field.
class QtyPicker extends StatefulWidget {
  /// Current quantity value
  final double value;

  /// Called when the quantity changes
  final ValueChanged<double> onChanged;

  /// Minimum allowed value (default: 1)
  final double min;

  /// Maximum allowed value (null = unlimited)
  final double? max;

  /// Step value for increment/decrement (default: 1)
  final double step;

  /// Whether to allow decimal values
  final bool allowDecimal;

  /// Custom label (optional, only shown for fullWidth type)
  final String? label;

  /// Whether the picker is enabled
  final bool enabled;

  /// Layout type
  final QtyPickerType type;

  /// Size for compact mode (affects button and text size)
  final double? compactSize;

  const QtyPicker({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 1,
    this.max,
    this.step = 1,
    this.allowDecimal = false,
    this.label,
    this.enabled = true,
    this.type = QtyPickerType.fullWidth,
    this.compactSize,
  });

  @override
  State<QtyPicker> createState() => _QtyPickerState();
}

class _QtyPickerState extends State<QtyPicker> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _formatQty(widget.value));
  }

  @override
  void didUpdateWidget(QtyPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _controller.text = _formatQty(widget.value);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _formatQty(double qty) {
    if (qty == qty.truncateToDouble()) {
      return qty.toInt().toString();
    }
    return qty.toStringAsFixed(1);
  }

  void _increment() {
    final newValue = widget.value + widget.step;
    if (widget.max == null || newValue <= widget.max!) {
      widget.onChanged(newValue);
    }
  }

  void _decrement() {
    final newValue = widget.value - widget.step;
    if (newValue >= widget.min) {
      widget.onChanged(newValue);
    }
  }

  void _onTextChanged(String text) {
    final parsed = double.tryParse(text.replaceAll(',', '.'));
    if (parsed != null && parsed >= widget.min) {
      if (widget.max == null || parsed <= widget.max!) {
        widget.onChanged(parsed);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final canDecrement = widget.enabled && widget.value > widget.min;
    final canIncrement =
        widget.enabled && (widget.max == null || widget.value < widget.max!);

    if (widget.type == QtyPickerType.compact) {
      return _buildCompact(theme, canDecrement, canIncrement);
    }
    return _buildFullWidth(theme, canDecrement, canIncrement);
  }

  Widget _buildFullWidth(
    ThemeData theme,
    bool canDecrement,
    bool canIncrement,
  ) {
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
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Decrement Button
              _QtyButton(
                icon: Icons.remove,
                onPressed: _decrement,
                enabled: canDecrement,
                primaryColor: theme.primaryColor,
              ),
              const SizedBox(width: 8),
              // Qty Input
              Container(
                height: 36,
                width: 80.0,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: TextField(
                    controller: _controller,
                    enabled: widget.enabled,
                    keyboardType: widget.allowDecimal
                        ? const TextInputType.numberWithOptions(decimal: true)
                        : TextInputType.number,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: widget.enabled
                          ? Colors.grey[800]
                          : Colors.grey[400],
                    ),
                    decoration: const InputDecoration(
                      fillColor: Colors.transparent,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                    ),
                    onChanged: _onTextChanged,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Increment Button
              _QtyButton(
                icon: Icons.add,
                onPressed: _increment,
                enabled: canIncrement,
                isPrimary: true,
                primaryColor: theme.primaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCompact(ThemeData theme, bool canDecrement, bool canIncrement) {
    final size = widget.compactSize ?? 32.0;
    final iconSize = size * 0.5;
    final fontSize = size * 0.4;

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(size / 2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Decrement Button
            _CompactQtyButton(
              icon: Icons.remove,
              onPressed: _decrement,
              enabled: canDecrement,
              size: size,
              iconSize: iconSize,
            ),
            // Qty Text
            GestureDetector(
              onTap: widget.enabled ? () => _showEditDialog() : null,
              child: Container(
                constraints: BoxConstraints(minWidth: size, maxWidth: size * 2),
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Text(
                  _formatQty(widget.value),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                    color: widget.enabled ? Colors.grey[800] : Colors.grey[400],
                  ),
                ),
              ),
            ),
            // Increment Button
            _CompactQtyButton(
              icon: Icons.add,
              onPressed: _increment,
              enabled: canIncrement,
              size: size,
              iconSize: iconSize,
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog() {
    final editController = TextEditingController(
      text: _formatQty(widget.value),
    );
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enter Quantity'),
        content: TextField(
          controller: editController,
          keyboardType: widget.allowDecimal
              ? const TextInputType.numberWithOptions(decimal: true)
              : TextInputType.number,
          textAlign: TextAlign.center,
          autofocus: true,
          decoration: const InputDecoration(border: OutlineInputBorder()),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final parsed = double.tryParse(
                editController.text.replaceAll(',', '.'),
              );
              if (parsed != null && parsed >= widget.min) {
                if (widget.max == null || parsed <= widget.max!) {
                  widget.onChanged(parsed);
                }
              }
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool enabled;
  final bool isPrimary;
  final Color primaryColor;

  const _QtyButton({
    required this.icon,
    required this.onPressed,
    required this.enabled,
    required this.primaryColor,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: enabled
          ? (isPrimary ? primaryColor.withValues(alpha: 0.1) : Colors.grey[100])
          : Colors.grey[50],
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: enabled ? onPressed : null,
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: 36,
          height: 36,
          child: Icon(
            icon,
            size: 18,
            color: enabled
                ? (isPrimary ? primaryColor : Colors.grey[700])
                : Colors.grey[300],
          ),
        ),
      ),
    );
  }
}

class _CompactQtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool enabled;
  final double size;
  final double iconSize;

  const _CompactQtyButton({
    required this.icon,
    required this.onPressed,
    required this.enabled,
    required this.size,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onPressed : null,
      borderRadius: BorderRadius.circular(size / 2),
      child: SizedBox(
        width: size,
        height: size,
        child: Icon(
          icon,
          size: iconSize,
          color: enabled ? Colors.grey[700] : Colors.grey[400],
        ),
      ),
    );
  }
}
