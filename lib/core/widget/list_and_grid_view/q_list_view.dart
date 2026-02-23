import 'package:flutter/material.dart';

/// Reusable responsive ListView with RefreshIndicator.
///
/// Handles responsive padding, physics, and bottom padding for FAB
/// so callers only provide `itemCount`, `itemBuilder`, and `onRefresh`.
///
/// ```dart
/// QListView(
///   itemCount: items.length,
///   onRefresh: _onRefresh,
///   itemBuilder: (context, index) => QListViewItem(...),
/// )
/// ```
class QListView extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Future<void> Function() onRefresh;

  const QListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final isDesktop = screenWidth >= 1024;
    final horizontalPadding = isDesktop ? 24.0 : (isTablet ? 16.0 : 12.0);

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.fromLTRB(
          horizontalPadding,
          0,
          horizontalPadding,
          80,
        ),
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
