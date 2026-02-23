import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kasir_baik/core/theme/theme.dart';

/// A reusable date picker field widget with consistent styling.
/// Similar to QTextField but for date selection.
class QDateField extends StatelessWidget {
  /// The label text displayed as floating label
  final String? label;

  /// Hint text when no date is selected
  final String? hint;

  /// The currently selected date
  final DateTime? value;

  /// Called when a date is selected
  final ValueChanged<DateTime?>? onChanged;

  /// The earliest selectable date (default: 10 years ago)
  final DateTime? firstDate;

  /// The latest selectable date (default: 10 years from now)
  final DateTime? lastDate;

  /// The initial date shown when picker opens (default: value or DateTime.now())
  final DateTime? initialDate;

  /// Date format for display (default: 'dd MMM yyyy')
  final String dateFormat;

  /// Icon to show as prefix (default: calendar icon)
  final IconData icon;

  /// Icon color (default: primaryColor)
  final Color? iconColor;

  /// Whether the field is clearable (shows X button when value is set)
  final bool clearable;

  /// Whether the field is enabled
  final bool enabled;

  /// Compact mode for inline usage (e.g., in a Row for date range)
  final bool compact;

  const QDateField({
    super.key,
    this.label,
    this.hint,
    this.value,
    this.onChanged,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.dateFormat = 'dd MMM yyyy',
    this.icon = Icons.calendar_today,
    this.iconColor,
    this.clearable = true,
    this.enabled = true,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveIconColor = iconColor ?? primaryColor;
    final effectiveHint = hint ?? 'Select date...';
    final displayText = value != null
        ? DateFormat(dateFormat).format(value!)
        : null;

    return InkWell(
      onTap: enabled ? () => _showPicker(context) : null,
      borderRadius: BorderRadius.circular(formFieldRadius),
      child: InputDecorator(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: label,
          hintText: effectiveHint,
          prefixIcon: Icon(
            icon,
            size: defaultFormFieldIconSize,
            color: enabled ? effectiveIconColor : Colors.grey,
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 36,
            minHeight: 0,
          ),
          suffixIcon: (clearable && value != null && enabled)
              ? IconButton(
                  icon: Icon(Icons.close, size: defaultFormFieldIconSize),
                  onPressed: () => onChanged?.call(null),
                  color: Colors.grey,
                  constraints: const BoxConstraints(
                    minWidth: 36,
                    minHeight: 0,
                  ),
                  padding: EdgeInsets.zero,
                )
              : null,
          suffixIconConstraints: const BoxConstraints(
            minWidth: 36,
            minHeight: 0,
          ),
          enabled: enabled,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(formFieldRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(formFieldRadius),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(formFieldRadius),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(formFieldRadius),
            borderSide: const BorderSide(color: primaryColor, width: 2),
          ),
          contentPadding: defaultFormWidgetPadding,
          isDense: compact,
        ),
        child: Text(
          displayText ?? effectiveHint,
          style: TextStyle(
            color: displayText != null
                ? (enabled ? Colors.black87 : Colors.grey[600])
                : Colors.grey,
            fontSize: defaultFormFieldFontSize,
          ),
        ),
      ),
    );
  }

  Future<void> _showPicker(BuildContext context) async {
    final now = DateTime.now();
    final effectiveFirstDate =
        firstDate ?? now.subtract(const Duration(days: 365 * 10));
    final effectiveLastDate =
        lastDate ?? now.add(const Duration(days: 365 * 10));
    final effectiveInitialDate = initialDate ?? value ?? now;

    // Ensure initial date is within bounds
    DateTime clampedInitialDate = effectiveInitialDate;
    if (clampedInitialDate.isBefore(effectiveFirstDate)) {
      clampedInitialDate = effectiveFirstDate;
    }
    if (clampedInitialDate.isAfter(effectiveLastDate)) {
      clampedInitialDate = effectiveLastDate;
    }

    final picked = await showDatePicker(
      context: context,
      initialDate: clampedInitialDate,
      firstDate: effectiveFirstDate,
      lastDate: effectiveLastDate,
    );

    if (picked != null) {
      onChanged?.call(picked);
    }
  }
}

/// A date range picker with start and end date fields
class QDateRangeField extends StatelessWidget {
  /// Label for the entire date range
  final String? label;

  /// Start date hint
  final String? startHint;

  /// End date hint
  final String? endHint;

  /// Currently selected start date
  final DateTime? startDate;

  /// Currently selected end date
  final DateTime? endDate;

  /// Called when start date changes
  final ValueChanged<DateTime?>? onStartDateChanged;

  /// Called when end date changes
  final ValueChanged<DateTime?>? onEndDateChanged;

  /// The earliest selectable date
  final DateTime? firstDate;

  /// The latest selectable date
  final DateTime? lastDate;

  /// Date format for display
  final String dateFormat;

  /// Whether fields are clearable
  final bool clearable;

  /// Whether the fields are enabled
  final bool enabled;

  /// The initial date shown when start date picker opens (default: startDate or DateTime.now())
  final DateTime? initialStartDate;

  /// The initial date shown when end date picker opens (default: endDate or startDate + 30 days)
  final DateTime? initialEndDate;

  const QDateRangeField({
    super.key,
    this.label,
    this.startHint,
    this.endHint,
    this.startDate,
    this.endDate,
    this.onStartDateChanged,
    this.onEndDateChanged,
    this.firstDate,
    this.lastDate,
    this.dateFormat = 'dd/MM/yy',
    this.clearable = true,
    this.enabled = true,
    this.initialStartDate,
    this.initialEndDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
        ],
        Row(
          children: [
            Expanded(
              child: QDateField(
                value: startDate,
                hint: startHint ?? 'Start',
                onChanged: onStartDateChanged,
                firstDate: firstDate,
                lastDate: lastDate,
                initialDate: initialStartDate ?? startDate ?? DateTime.now(),
                dateFormat: dateFormat,
                clearable: clearable,
                enabled: enabled,
                compact: true,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text('-'),
            ),
            Expanded(
              child: QDateField(
                value: endDate,
                hint: endHint ?? 'End',
                onChanged: onEndDateChanged,
                firstDate: firstDate,
                lastDate: lastDate,
                initialDate: initialEndDate ?? endDate ?? startDate?.add(const Duration(days: 30)) ?? DateTime.now(),
                dateFormat: dateFormat,
                clearable: clearable,
                enabled: enabled,
                compact: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
