import 'package:flutter/material.dart';
import 'package:kantor_lurah/core/util/contextless/navigation.dart';

/// A menu item for the bottom sheet menu.
class MenuSheetItem {
  final String label;
  final IconData icon;
  final Color? color;
  final VoidCallback onTap;

  const MenuSheetItem({
    required this.label,
    required this.icon,
    this.color,
    required this.onTap,
  });
}

/// Contextless utility for showing a bottom sheet with menu options.
class AppMenuSheet {
  static Future<void> show({
    String? title,
    required List<MenuSheetItem> items,
  }) async {
    final context = Nav.navigatorKey.currentContext;
    if (context == null) return;

    await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              if (title != null) ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Divider(),
              ] else
                const SizedBox(height: 8),
              ...items.map(
                (item) => ListTile(
                  leading: Icon(item.icon, color: item.color),
                  title: Text(item.label, style: TextStyle(color: item.color)),
                  onTap: () {
                    Navigator.pop(context);
                    item.onTap();
                  },
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}

/// Shortcut function for showing menu sheet.
Future<void> showMenuSheet({
  String? title,
  required List<MenuSheetItem> items,
}) {
  return AppMenuSheet.show(title: title, items: items);
}
