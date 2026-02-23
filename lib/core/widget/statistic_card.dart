import 'package:flutter/material.dart';
import 'package:kantor_lurah/core/theme/theme.dart';

/// A reusable statistic card widget for displaying summary statistics.
///
/// Use this widget in dashboards and report views to display key metrics.
///
/// **Layout Rules:**
/// - Maximum 2 cards per row
/// - If you need 4 cards, use 2 rows with 2 cards each
/// - Use StatisticCardRow or StatisticCardGrid for proper layout
///
/// Example usage:
/// ```dart
/// StatisticCardGrid(
///   children: [
///     StatisticCard(
///       title: 'Total Sales',
///       value: 'Rp 1,500,000',
///       icon: Icons.attach_money,
///       color: Colors.green,
///     ),
///     StatisticCard(
///       title: 'Orders',
///       value: '25',
///       icon: Icons.receipt_long,
///       color: Colors.blue,
///     ),
///   ],
/// )
/// ```
class StatisticCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  /// Optional subtitle shown below the value
  final String? subtitle;

  /// Optional extra info shown below the subtitle
  final String? extraInfo;

  const StatisticCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.onTap,
    this.subtitle,
    this.extraInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: color.withValues(alpha: 0.2), width: 1),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                color.withValues(alpha: 0.1),
                color.withValues(alpha: 0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: -40,
                top: -40,
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color.withValues(alpha: 0.1),
                  ),
                ),
              ),
              Positioned(
                right: 2,
                top: 2,
                child: FittedBox(
                  child: Icon(
                    icon,
                    color: color.withValues(alpha: 0.1),
                    size: 42,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        value,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: color,
                        ),
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    if (extraInfo != null) ...[
                      Text(
                        extraInfo!,
                        style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A helper widget to layout StatisticCards in rows.
///
/// **Rules:**
/// - Maximum 2 cards per row
/// - Cards are distributed in rows of 2
///
/// Example:
/// ```dart
/// StatisticCardGrid(
///   children: [card1, card2, card3, card4], // Will create 2 rows
/// )
/// ```
class StatisticCardGrid extends StatelessWidget {
  final List<StatisticCard> children;
  final double spacing;

  const StatisticCardGrid({
    super.key,
    required this.children,
    this.spacing = AppTheme.cardSpacing,
  });

  @override
  Widget build(BuildContext context) {
    // Split children into rows of 2
    final rows = <List<StatisticCard>>[];
    for (var i = 0; i < children.length; i += 2) {
      final end = (i + 2 > children.length) ? children.length : i + 2;
      rows.add(children.sublist(i, end));
    }

    return Column(
      children: rows.asMap().entries.map((entry) {
        final index = entry.key;
        final row = entry.value;

        return Padding(
          padding: EdgeInsets.only(
            bottom: index < rows.length - 1 ? spacing : 0,
          ),
          child: Row(
            children: row.asMap().entries.map((cardEntry) {
              final cardIndex = cardEntry.key;
              final card = cardEntry.value;

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: cardIndex > 0 ? spacing / 2 : 0,
                    right: cardIndex < row.length - 1 ? spacing / 2 : 0,
                  ),
                  child: card,
                ),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }
}

/// A single row of StatisticCards (max 2 cards).
///
/// Use this when you want more control over individual rows.
class StatisticCardRow extends StatelessWidget {
  final List<StatisticCard> children;
  final double spacing;

  const StatisticCardRow({
    super.key,
    required this.children,
    this.spacing = AppTheme.cardSpacing,
  }) : assert(
         children.length <= 2,
         'StatisticCardRow can only have 2 cards max',
       );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: children.asMap().entries.map((entry) {
        final index = entry.key;
        final card = entry.value;

        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: index > 0 ? spacing / 2 : 0,
              right: index < children.length - 1 ? spacing / 2 : 0,
            ),
            child: card,
          ),
        );
      }).toList(),
    );
  }
}
