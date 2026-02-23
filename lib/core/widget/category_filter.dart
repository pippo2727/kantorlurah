import 'package:flutter/material.dart';

// ============================================================================
// CategoryFilterItem - untuk CategoryFilter (horizontal scrollable)
// ============================================================================
class CategoryFilterItem {
  final String id;
  final String label;
  final Color? color;
  final IconData? icon;

  const CategoryFilterItem({
    required this.id,
    required this.label,
    this.color,
    this.icon,
  });
}

// ============================================================================
// CategoryFilter - Horizontal scrollable filter dengan single select
// ============================================================================
class CategoryFilter extends StatelessWidget {
  final List<CategoryFilterItem> items;
  final String? selectedId;
  final ValueChanged<String?> onSelected;
  final bool showAllOption;
  final String allLabel;
  final EdgeInsetsGeometry? padding;

  const CategoryFilter({
    super.key,
    required this.items,
    required this.selectedId,
    required this.onSelected,
    this.showAllOption = true,
    this.allLabel = 'All',
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 12),
        children: [
          if (showAllOption)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: FilterChip(
                label: Text(allLabel),
                selected: selectedId == null,
                onSelected: (_) => onSelected(null),
                selectedColor: Theme.of(
                  context,
                ).primaryColor.withValues(alpha: 0.2),
                checkmarkColor: Theme.of(context).primaryColor,
                labelStyle: TextStyle(
                  color: selectedId == null
                      ? Theme.of(context).primaryColor
                      : Colors.grey[700],
                  fontWeight: selectedId == null
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: FilterChip(
                avatar: item.icon != null
                    ? Icon(
                        item.icon,
                        size: 16,
                        color: selectedId == item.id
                            ? (item.color ?? Theme.of(context).primaryColor)
                            : Colors.grey,
                      )
                    : null,
                label: Text(item.label),
                selected: selectedId == item.id,
                onSelected: (_) => onSelected(item.id),
                selectedColor: (item.color ?? Theme.of(context).primaryColor)
                    .withValues(alpha: 0.2),
                checkmarkColor: item.color ?? Theme.of(context).primaryColor,
                labelStyle: TextStyle(
                  color: selectedId == item.id
                      ? (item.color ?? Theme.of(context).primaryColor)
                      : Colors.grey[700],
                  fontWeight: selectedId == item.id
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// StatusChip - Read-only status badge chip
// ============================================================================
class StatusChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color? color;
  final Color? textColor;

  const StatusChip({
    super.key,
    required this.label,
    this.icon,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = color ?? Colors.grey[100]!;
    final fgColor =
        textColor ?? (color != null ? Colors.white : Colors.grey[800]!);

    return Chip(
      avatar: icon != null ? Icon(icon, size: 18, color: fgColor) : null,
      label: Text(label, style: TextStyle(color: fgColor)),
      backgroundColor: bgColor,
      padding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}

// ============================================================================
// SelectableChipItem - untuk SelectableChipWrap (multi-select)
// ============================================================================
class SelectableChipItem {
  final String id;
  final String label;
  final String? subtitle;
  final Color? color;

  const SelectableChipItem({
    required this.id,
    required this.label,
    this.subtitle,
    this.color,
  });
}

// ============================================================================
// SelectableChipWrap - Multi-select chips dalam Wrap
// ============================================================================
class SelectableChipWrap extends StatelessWidget {
  final List<SelectableChipItem> items;
  final List<String> selectedIds;
  final ValueChanged<List<String>> onChanged;
  final Color? selectedColor;
  final double spacing;
  final double runSpacing;

  const SelectableChipWrap({
    super.key,
    required this.items,
    required this.selectedIds,
    required this.onChanged,
    this.selectedColor,
    this.spacing = 8,
    this.runSpacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    final color = selectedColor ?? Colors.teal;

    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      children: items.map((item) {
        final isSelected = selectedIds.contains(item.id);
        final itemColor = item.color ?? color;
        return FilterChip(
          label: item.subtitle != null
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.label,
                      style: TextStyle(
                        color: isSelected ? itemColor : Colors.black87,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    Text(
                      item.subtitle!,
                      style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                    ),
                  ],
                )
              : Text(
                  item.label,
                  style: TextStyle(
                    color: isSelected ? itemColor : Colors.black87,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
          selected: isSelected,
          onSelected: (selected) {
            final newIds = List<String>.from(selectedIds);
            if (selected) {
              newIds.add(item.id);
            } else {
              newIds.remove(item.id);
            }
            onChanged(newIds);
          },
          selectedColor: itemColor.withValues(alpha: 0.2),
          checkmarkColor: itemColor,
        );
      }).toList(),
    );
  }
}

// ============================================================================
// DeletableChipItem - untuk DeletableChipList
// ============================================================================
class DeletableChipItem {
  final String id;
  final String label;
  final bool isDeletable;
  final Color? color;

  const DeletableChipItem({
    required this.id,
    required this.label,
    this.isDeletable = true,
    this.color,
  });
}

// ============================================================================
// DeletableChipList - Chips dengan delete button dalam Wrap
// ============================================================================
class DeletableChipList extends StatelessWidget {
  final List<DeletableChipItem> items;
  final ValueChanged<String> onDeleted;
  final Color? primaryColor;
  final double spacing;
  final double runSpacing;

  const DeletableChipList({
    super.key,
    required this.items,
    required this.onDeleted,
    this.primaryColor,
    this.spacing = 8,
    this.runSpacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    final color = primaryColor ?? Colors.blue;

    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      children: items.map((item) {
        final isPrimary = !item.isDeletable;
        return Chip(
          label: Text(item.label),
          deleteIcon: item.isDeletable
              ? const Icon(Icons.close, size: 18)
              : null,
          onDeleted: item.isDeletable ? () => onDeleted(item.id) : null,
          backgroundColor: isPrimary
              ? (item.color ?? color).withValues(alpha: 0.2)
              : Colors.grey[200],
          labelStyle: TextStyle(
            color: isPrimary ? (item.color ?? color) : Colors.grey[800],
            fontWeight: isPrimary ? FontWeight.bold : FontWeight.normal,
          ),
        );
      }).toList(),
    );
  }
}

// ============================================================================
// SingleSelectChipItem - untuk SingleSelectChipRow
// ============================================================================
class SingleSelectChipItem {
  final String id;
  final String label;
  final Color? selectedColor;
  final Color? selectedTextColor;

  const SingleSelectChipItem({
    required this.id,
    required this.label,
    this.selectedColor,
    this.selectedTextColor,
  });
}

// ============================================================================
// SingleSelectChipRow - Single select chips dalam Row (untuk payment type dll)
// ============================================================================
class SingleSelectChipRow extends StatelessWidget {
  final List<SingleSelectChipItem> items;
  final String? selectedId;
  final ValueChanged<String> onSelected;
  final double spacing;

  const SingleSelectChipRow({
    super.key,
    required this.items,
    required this.selectedId,
    required this.onSelected,
    this.spacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final isSelected = selectedId == item.id;
        final selectedBg = item.selectedColor ?? Colors.green[100]!;
        final selectedFg = item.selectedTextColor ?? Colors.green[800]!;

        return Padding(
          padding: EdgeInsets.only(left: index > 0 ? spacing : 0),
          child: ChoiceChip(
            label: Text(item.label),
            selected: isSelected,
            onSelected: (_) => onSelected(item.id),
            selectedColor: selectedBg,
            labelStyle: TextStyle(
              color: isSelected ? selectedFg : Colors.grey[600],
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        );
      }).toList(),
    );
  }
}

// ============================================================================
// InfoChip - Read-only info display dengan icon dan label (bukan Chip widget)
// ============================================================================
class InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? iconColor;
  final Color? textColor;
  final double iconSize;
  final double fontSize;

  const InfoChip({
    super.key,
    required this.icon,
    required this.label,
    this.iconColor,
    this.textColor,
    this.iconSize = 14,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: iconSize, color: iconColor ?? Colors.grey),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor ?? Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// QuickActionChip - Tappable chip untuk quick actions (amount, etc)
// ============================================================================
class QuickActionChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isHighlighted;
  final Color? highlightColor;
  final Color? backgroundColor;
  final Color? textColor;

  const QuickActionChip({
    super.key,
    required this.label,
    required this.onTap,
    this.isHighlighted = false,
    this.highlightColor,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final highlightBg = highlightColor ?? Colors.green;
    final defaultBg = backgroundColor ?? Colors.grey[100]!;
    final defaultText = textColor ?? Colors.grey[700]!;

    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isHighlighted
                ? highlightBg.withValues(alpha: 0.1)
                : defaultBg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isHighlighted ? highlightBg : Colors.grey[300]!,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isHighlighted ? highlightBg : defaultText,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// QuickAmountSelector - Reusable quick amount chips for payment forms
// ============================================================================

/// A single quick amount option
class QuickAmountOption {
  final String label;
  final String id;
  final double amount;

  const QuickAmountOption({
    required this.label,
    required this.id,
    required this.amount,
  });
}

/// Reusable quick amount selector with horizontal scrollable chips.
/// Used in payment forms (POS, Credit, Debt) for quick amount selection.
class QuickAmountSelector extends StatelessWidget {
  /// The currently selected chip id (e.g. 'exact', '50k', '100k')
  final String? selectedId;

  /// Callback when a quick amount is tapped. Returns the id and amount.
  final void Function(String id, double amount) onSelected;

  /// The total/remaining amount for the "Exact" chip
  final double totalAmount;

  /// Custom options. If null, uses default options.
  final List<QuickAmountOption>? options;

  /// Label for the exact amount chip
  final String exactLabel;

  /// Whether to show percentage-based options (50%)
  final bool showPercentageOptions;

  /// Whether to show a "Full" option (same as exact but separate label)
  final bool showFullOption;

  /// Label for the full amount chip
  final String fullLabel;

  const QuickAmountSelector({
    super.key,
    this.selectedId,
    required this.onSelected,
    required this.totalAmount,
    this.options,
    this.exactLabel = 'Exact',
    this.showPercentageOptions = false,
    this.showFullOption = false,
    this.fullLabel = 'Full',
  });

  List<QuickAmountOption> get _defaultOptions {
    return [
      QuickAmountOption(label: exactLabel, id: 'exact', amount: totalAmount),
      if (showFullOption)
        QuickAmountOption(label: fullLabel, id: 'full', amount: totalAmount),
      if (showPercentageOptions)
        QuickAmountOption(
          label: '50%',
          id: '50pct',
          amount: totalAmount / 2,
        ),
      const QuickAmountOption(label: '50k', id: '50k', amount: 50000),
      const QuickAmountOption(label: '100k', id: '100k', amount: 100000),
      const QuickAmountOption(label: '150k', id: '150k', amount: 150000),
      const QuickAmountOption(label: '200k', id: '200k', amount: 200000),
      const QuickAmountOption(label: '300k', id: '300k', amount: 300000),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final effectiveOptions = options ?? _defaultOptions;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: effectiveOptions.map((option) {
          return QuickActionChip(
            label: option.label,
            onTap: () => onSelected(option.id, option.amount),
            isHighlighted: selectedId == option.id,
          );
        }).toList(),
      ),
    );
  }
}

// ============================================================================
// SelectableActionChip - Tappable chip dengan selected state (currency, tax, etc)
// ============================================================================
class SelectableActionChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;

  const SelectableActionChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.selectedColor,
    this.unselectedColor,
    this.selectedTextColor,
    this.unselectedTextColor,
    this.borderRadius = 20,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final selectedBg = selectedColor ?? Colors.teal;
    final unselectedBg = unselectedColor ?? Colors.grey[100]!;
    final selectedFg = selectedTextColor ?? Colors.white;
    final unselectedFg = unselectedTextColor ?? Colors.grey[700]!;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? selectedBg : unselectedBg,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: isSelected ? selectedBg : Colors.grey[300]!,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? selectedFg : unselectedFg,
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// SelectionCard - Card-like selection widget with icon & label (role, type picker)
// ============================================================================
class SelectionCard extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool isSelected;
  final VoidCallback? onTap;
  final bool isDisabled;
  final Color? selectedColor;
  final Color? disabledColor;
  final double iconSize;
  final double fontSize;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;

  const SelectionCard({
    super.key,
    required this.label,
    this.icon,
    required this.isSelected,
    this.onTap,
    this.isDisabled = false,
    this.selectedColor,
    this.disabledColor,
    this.iconSize = 28,
    this.fontSize = 13,
    this.borderRadius = 12,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveSelected = isSelected && !isDisabled;
    final color = selectedColor ?? Colors.blue;
    final effectiveColor = isDisabled
        ? (disabledColor ?? Colors.grey[400]!)
        : (isSelected ? color : Colors.grey);

    return InkWell(
      onTap: isDisabled ? null : onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        padding: padding ?? const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isDisabled
              ? Colors.grey[200]
              : (effectiveSelected
                    ? color.withValues(alpha: 0.1)
                    : Colors.grey[100]),
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: isDisabled
                ? Colors.grey[300]!
                : (isSelected ? color : Colors.grey[300]!),
            width: isSelected && !isDisabled ? 2 : 1,
          ),
        ),
        child: icon != null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, color: effectiveColor, size: iconSize),
                  const SizedBox(height: 8),
                  Text(
                    label,
                    style: TextStyle(
                      color: isDisabled
                          ? Colors.grey[400]
                          : (isSelected ? color : Colors.grey[700]),
                      fontWeight: isSelected && !isDisabled
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontSize: fontSize,
                    ),
                  ),
                ],
              )
            : Center(
                child: Text(
                  label,
                  style: TextStyle(
                    color: isDisabled
                        ? Colors.grey[400]
                        : (isSelected ? color : Colors.grey[700]),
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                    fontSize: fontSize,
                  ),
                ),
              ),
      ),
    );
  }
}

// ============================================================================
// MarkupSelector - Horizontal percentage markup chips for price calculation
// ============================================================================
class MarkupSelectorItem {
  final double percentage;
  final String? label;

  const MarkupSelectorItem({required this.percentage, this.label});

  String get displayLabel => label ?? '${percentage.toStringAsFixed(0)}%';
}

class MarkupSelector extends StatelessWidget {
  final List<MarkupSelectorItem> items;
  final double? selectedPercentage;
  final ValueChanged<double> onSelected;
  final Color? selectedColor;
  final EdgeInsetsGeometry? padding;

  const MarkupSelector({
    super.key,
    required this.items,
    this.selectedPercentage,
    required this.onSelected,
    this.selectedColor,
    this.padding,
  });

  /// Default markup percentages: 5%, 10%, 15%, 25%
  static const List<MarkupSelectorItem> defaultItems = [
    MarkupSelectorItem(percentage: 5),
    MarkupSelectorItem(percentage: 10),
    MarkupSelectorItem(percentage: 15),
    MarkupSelectorItem(percentage: 25),
  ];

  @override
  Widget build(BuildContext context) {
    final color = selectedColor ?? Colors.teal;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        children: items.map((item) {
          final isSelected = selectedPercentage == item.percentage;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              onTap: () => onSelected(item.percentage),
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? color.withValues(alpha: 0.1)
                      : Colors.grey[100],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected ? color : Colors.grey[300]!,
                  ),
                ),
                child: Text(
                  item.displayLabel,
                  style: TextStyle(
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: isSelected ? color : Colors.grey[700],
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ============================================================================
// VariantSelector - Reusable variant selection widget for products
// ============================================================================
class VariantSelectorItem {
  final String id;
  final String name;
  final List<String> options;

  const VariantSelectorItem({
    required this.id,
    required this.name,
    required this.options,
  });
}

class VariantSelector extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<VariantSelectorItem> variants;
  final List<String> selectedIds;
  final ValueChanged<List<String>> onChanged;
  final Color? selectedColor;
  final IconData? icon;

  const VariantSelector({
    super.key,
    required this.title,
    this.subtitle,
    required this.variants,
    required this.selectedIds,
    required this.onChanged,
    this.selectedColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    if (variants.isEmpty) return const SizedBox.shrink();

    final color = selectedColor ?? Colors.teal;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon ?? Icons.style, color: color, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 8),
            Text(
              subtitle!,
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ],
          const SizedBox(height: 12),
          SelectableChipWrap(
            items: variants.map((variant) {
              final optionsText =
                  variant.options.take(3).join(', ') +
                  (variant.options.length > 3 ? '...' : '');
              return SelectableChipItem(
                id: variant.id,
                label: variant.name,
                subtitle: optionsText,
              );
            }).toList(),
            selectedIds: selectedIds,
            selectedColor: color,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
