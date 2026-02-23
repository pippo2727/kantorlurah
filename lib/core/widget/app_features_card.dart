import 'package:flutter/material.dart';

/// Data model for a feature group
class FeatureGroup {
  final String title;
  final IconData icon;
  final Color color;
  final List<String> items;

  const FeatureGroup({
    required this.title,
    required this.icon,
    required this.color,
    required this.items,
  });
}

/// A card widget that displays app features grouped by category
/// with expandable/collapsible sections.
class AppFeaturesCard extends StatelessWidget {
  /// Whether all groups should be initially expanded
  final bool initiallyExpanded;

  /// Custom title for the card (defaults to 'App Features')
  final String? title;

  /// Custom icon for the card header (defaults to Icons.star)
  final IconData? titleIcon;

  /// Custom icon color (defaults to Colors.amber)
  final Color? titleIconColor;

  const AppFeaturesCard({
    super.key,
    this.initiallyExpanded = true,
    this.title,
    this.titleIcon,
    this.titleIconColor,
  });

  static List<FeatureGroup> get defaultFeatures => [
    const FeatureGroup(
      title: 'Transactions',
      icon: Icons.swap_horiz,
      color: Colors.green,
      items: [
        'Point of Sale (POS)',
        'Customer Credits',
        'Supplier Debts',
        'Expense Management',
        'Purchase Orders',
        'Stock Adjustment',
      ],
    ),
    FeatureGroup(
      title: 'Reports',
      icon: Icons.bar_chart,
      color: Colors.blue,
      items: const [
        'Sales Report',
        'Cashflow Report',
        'Profit & Loss',
        'Product Sales Profit',
        'Credit Report',
        'Debt Report',
        'Expense Report',
        'Inventory Report',
        'Product Performance',
        'Customer Report',
        'Staff Performance',
        'Payment Methods',
        'Hourly Sales',
        'Supplier Report',
        'Purchase Order Report',
        'Stock History',
        'Stock Adjustment Report',
      ],
    ),
    const FeatureGroup(
      title: 'Master Data',
      icon: Icons.folder,
      color: Colors.orange,
      items: [
        'Products & Categories',
        'Product Variants',
        'Customers & Suppliers',
        'Payment Methods',
        'Vouchers & Discounts',
        'User Management',
      ],
    ),
    const FeatureGroup(
      title: 'Others',
      icon: Icons.more_horiz,
      color: Colors.purple,
      items: [
        'Thermal Printer Support',
        'Export Data (Excel/PDF)',
        'Multi-language (ID/EN)',
        'Table Mode (Restaurant)',
        'Barcode Scanner',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final features = defaultFeatures;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  titleIcon ?? Icons.star,
                  color: titleIconColor ?? Colors.amber,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  title ?? 'App Features',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...features.map(
              (group) => _FeatureGroupTile(
                group: group,
                initiallyExpanded: initiallyExpanded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureGroupTile extends StatelessWidget {
  final FeatureGroup group;
  final bool initiallyExpanded;

  const _FeatureGroupTile({
    required this.group,
    required this.initiallyExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      childrenPadding: const EdgeInsets.only(left: 8, bottom: 8),
      initiallyExpanded: initiallyExpanded,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: group.color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(group.icon, color: group.color, size: 20),
      ),
      title: Text(
        group.title,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      ),
      subtitle: Text(
        '${group.items.length} features',
        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
      ),
      children: group.items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: group.color, size: 16),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(item, style: const TextStyle(fontSize: 13)),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
