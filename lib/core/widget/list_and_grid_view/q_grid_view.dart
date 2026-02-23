import 'package:flutter/material.dart';
import 'package:kantor_lurah/core/theme/theme.dart';

/// Reusable responsive GridView with RefreshIndicator.
///
/// Handles responsive crossAxisCount, padding, spacing, and physics
/// so callers only provide `itemCount`, `itemBuilder`, and `onRefresh`.
///
/// ```dart
/// QGridView(
///   itemCount: items.length,
///   onRefresh: _onRefresh,
///   itemBuilder: (context, index) => QGridViewItem(...),
/// )
/// ```
class QGridView extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Future<void> Function() onRefresh;
  final double childAspectRatio;

  const QGridView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.onRefresh,
    this.childAspectRatio = 0.75,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final isDesktop = screenWidth >= 1024;
    final crossAxisCount = isDesktop ? 4 : (isTablet ? 3 : 2);
    final horizontalPadding = isDesktop ? 24.0 : (isTablet ? 16.0 : 12.0);

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: GridView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.fromLTRB(
          horizontalPadding,
          0,
          horizontalPadding,
          80,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: gridSpacing,
          mainAxisSpacing: gridSpacing,
          childAspectRatio: childAspectRatio,
        ),
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
