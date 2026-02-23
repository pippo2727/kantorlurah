import 'package:flutter/material.dart';
import 'package:kantor_lurah/core/theme/theme.dart';

/// Empty state widget for displaying when there's no data
/// Provides consistent empty state UI across the app
class EmptyStateWidget extends StatelessWidget {
  final IconData icon;
  final String message;
  final String? subtitle;
  final Widget? action;
  final double iconSize;
  final Color? iconColor;

  const EmptyStateWidget({
    super.key,
    required this.icon,
    required this.message,
    this.subtitle,
    this.action,
    this.iconSize = 64,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: iconSize,
              color: iconColor ?? Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 8),
              Text(
                subtitle!,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (action != null) ...[
              const SizedBox(height: 16),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}

/// View mode toggle for switching between grid and list views
/// Used in management views for consistent view switching
class ViewModeToggle extends StatelessWidget {
  final bool isGridView;
  final ValueChanged<bool> onChanged;
  final Color? selectedColor;

  const ViewModeToggle({
    super.key,
    required this.isGridView,
    required this.onChanged,
    this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = selectedColor ?? primaryColor;
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildButton(
            Icons.grid_view_rounded,
            isGridView,
            () => onChanged(true),
            activeColor,
          ),
          _buildButton(
            Icons.view_list_rounded,
            !isGridView,
            () => onChanged(false),
            activeColor,
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
    IconData icon,
    bool isSelected,
    VoidCallback onTap,
    Color activeColor,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? activeColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 20,
          color: isSelected ? Colors.white : Colors.grey[600],
        ),
      ),
    );
  }
}

/// Detail row for displaying label-value pairs
/// Used in detail sheets and info displays
class DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;
  final Color? iconColor;
  final Color? valueColor;
  final bool isBold;
  final double? labelWidth;
  final bool useFittedBox;

  const DetailRow({
    super.key,
    required this.label,
    required this.value,
    this.icon,
    this.iconColor,
    this.valueColor,
    this.isBold = false,
    this.labelWidth,
    this.useFittedBox = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 20, color: iconColor ?? Colors.grey[600]),
            const SizedBox(width: 12),
          ],
          if (labelWidth != null)
            SizedBox(
              width: labelWidth,
              child: Text(
                label,
                style: TextStyle(color: Colors.grey[600]),
              ),
            )
          else
            Expanded(
              child: Text(
                label,
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          if (labelWidth != null)
            Expanded(child: _buildValue())
          else
            _buildValue(),
        ],
      ),
    );
  }

  Widget _buildValue() {
    final textWidget = Text(
      value,
      style: TextStyle(
        fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
        color: valueColor,
      ),
      textAlign: TextAlign.right,
    );

    if (useFittedBox) {
      return FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerRight,
        child: textWidget,
      );
    }
    return textWidget;
  }
}

/// Filter icon button with badge for active filters
/// Used in AppBar actions for filter dialogs
class FilterIconButton extends StatelessWidget {
  final bool hasActiveFilters;
  final VoidCallback onPressed;
  final String? tooltip;

  const FilterIconButton({
    super.key,
    required this.hasActiveFilters,
    required this.onPressed,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      icon: Badge(
        isLabelVisible: hasActiveFilters,
        child: const Icon(Icons.filter_list),
      ),
      onPressed: onPressed,
    );
  }
}

/// Section header with optional icon and trailing widget
/// Used to separate sections in forms and detail views
class SectionHeader extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Color? color;
  final Widget? trailing;
  final double fontSize;

  const SectionHeader({
    super.key,
    required this.title,
    this.icon,
    this.color,
    this.trailing,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, size: 18, color: effectiveColor),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: fontSize,
                color: effectiveColor,
              ),
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}

/// Line item row for financial reports
/// Displays label and currency value with optional negative styling
class LineItemRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isNegative;
  final Color? valueColor;
  final EdgeInsetsGeometry? padding;

  const LineItemRow({
    super.key,
    required this.label,
    required this.value,
    this.isNegative = false,
    this.valueColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              label,
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
          const SizedBox(width: 8),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              isNegative ? '-$value' : value,
              style: TextStyle(
                color: valueColor ?? (isNegative ? dangerColor : Colors.grey[700]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Summary row with icon for reports
/// Used in summary sections with colored icons
class SummaryRowWithIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final bool isBold;
  final EdgeInsetsGeometry? padding;

  const SummaryRowWithIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    this.isBold = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: TextStyle(
                color: color,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Total row with highlighted background
/// Used for totals and important summary lines
class TotalRow extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final bool isLarge;
  final EdgeInsetsGeometry? margin;

  const TotalRow({
    super.key,
    required this.label,
    required this.value,
    required this.color,
    this.isLarge = false,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isLarge ? 12 : 8,
        horizontal: 16,
      ),
      margin: margin ?? const EdgeInsets.only(top: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isLarge ? 16 : 14,
                color: color,
              ),
            ),
          ),
          const SizedBox(width: 8),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isLarge ? 16 : 14,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Bullet point for help dialogs and lists
/// Simple bullet with text
class BulletPoint extends StatelessWidget {
  final String text;
  final String bullet;
  final Color? bulletColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final double fontSize;

  const BulletPoint({
    super.key,
    required this.text,
    this.bullet = '•',
    this.bulletColor,
    this.textStyle,
    this.padding,
    this.fontSize = 13,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveTextStyle = textStyle ??
        TextStyle(
          color: Colors.grey[700],
          fontSize: fontSize,
        );
    return Padding(
      padding: padding ?? const EdgeInsets.only(left: 8, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$bullet ',
            style: TextStyle(color: bulletColor ?? Colors.grey[700]),
          ),
          Expanded(
            child: Text(
              text,
              style: effectiveTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}

/// Search bar with view mode toggle
/// Combined widget for management views
class SearchBarWithViewToggle extends StatelessWidget {
  final String? label;
  final String searchQuery;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback? onClear;
  final bool isGridView;
  final ValueChanged<bool> onViewModeChanged;
  final Color? viewModeColor;
  final Widget? leading;

  const SearchBarWithViewToggle({
    super.key,
    this.label,
    required this.searchQuery,
    required this.onSearchChanged,
    this.onClear,
    required this.isGridView,
    required this.onViewModeChanged,
    this.viewModeColor,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          if (leading != null) ...[
            leading!,
            const SizedBox(width: 12),
          ],
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                labelText: label ?? 'Search...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: onClear,
                      )
                    : null,
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
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              onChanged: onSearchChanged,
            ),
          ),
          const SizedBox(width: 12),
          ViewModeToggle(
            isGridView: isGridView,
            onChanged: onViewModeChanged,
            selectedColor: viewModeColor,
          ),
        ],
      ),
    );
  }
}
