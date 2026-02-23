import 'package:flutter/material.dart';
import 'package:kasir_baik/core/util/contextless/navigation.dart';

/// Model for menu group containing multiple menu items
class MenuGroup {
  final String title;
  final List<MenuItem> items;

  MenuGroup({
    required this.title,
    required this.items,
  });
}

/// Model for individual menu item
class MenuItem {
  final String? menuId; // Used for menu visibility settings
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String? iconAsset; // Optional asset image path (e.g. 'assets/menu_icon/pos.png')
  final Widget? page;
  final VoidCallback? onTap;
  final Future<void> Function()? onBeforeNavigate;
  final Future<void> Function()? onAfterNavigate;
  final bool adminOnly;
  final int badgeCount; // Badge count to display on menu icon

  MenuItem({
    this.menuId,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    this.iconAsset,
    this.page,
    this.onTap,
    this.onBeforeNavigate,
    this.onAfterNavigate,
    this.adminOnly = false,
    this.badgeCount = 0,
  });
}

/// Widget to display a group of menu items in a grid
class MenuGroupWidget extends StatelessWidget {
  final MenuGroup group;
  final VoidCallback? onAfterNavigate;

  const MenuGroupWidget({super.key, required this.group, this.onAfterNavigate});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final isDesktop = screenWidth >= 1024;
    final crossAxisCount = isDesktop ? 4 : (isTablet ? 4 : 4);
    final childAspectRatio = isDesktop ? 1.0 : (isTablet ? 0.95 : 0.85);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            group.title,
            style: TextStyle(
              fontSize: isTablet ? 18 : 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: group.items.length,
          itemBuilder: (context, index) => MenuCard(
            item: group.items[index],
            onAfterNavigate: onAfterNavigate,
          ),
        ),
      ],
    );
  }
}

/// Widget for individual menu card
class MenuCard extends StatelessWidget {
  final MenuItem item;
  final VoidCallback? onAfterNavigate;

  const MenuCard({
    super.key,
    required this.item,
    this.onAfterNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: item.color.withValues(alpha: 0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () async {
          if (item.onTap != null) {
            item.onTap!();
            return;
          }
          if (item.page == null) return;

          if (item.onBeforeNavigate != null) {
            await item.onBeforeNavigate!();
          }
          await Nav.to(item.page!);
          if (item.onAfterNavigate != null) {
            await item.onAfterNavigate!();
          }
          onAfterNavigate?.call();
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [item.color.withValues(alpha: 0.85), item.color],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: Icon(item.icon, size: 28, color: Colors.white)),
                Text(
                  "${item.title}\n",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white, fontSize: 9),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
