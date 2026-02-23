import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kantor_lurah/core/theme/theme.dart';

/// Data model for a badge overlay on grid image
class ItemBadge {
  final String label;
  final Color color;

  const ItemBadge({
    required this.label,
    required this.color,
  });
}

/// Reusable grid view item with image, title, subtitle, and caption.
///
/// Use for product grid, customer grid, supplier grid, etc.
/// Supports optional image URL, placeholder icon, and badge overlay.
///
/// **Simple mode** — use imageUrl/title/subtitle/caption:
/// ```dart
/// QGridViewItem(
///   imageUrl: product.photo,
///   placeholderIcon: Icons.inventory,
///   title: product.name,
///   subtitle: 'Rp 10,000',
///   subtitleColor: Colors.green,
///   caption: 'Category Name',
///   badge: ItemBadge(label: '5', color: Colors.green),
///   onTap: () => _showMenu(product),
/// )
/// ```
///
/// **Colored placeholder** — use placeholderColor/placeholderText for
/// items without images (e.g. customer initial letter):
/// ```dart
/// QGridViewItem(
///   placeholderColor: Colors.blue,
///   placeholderText: 'J',
///   title: 'John Doe',
///   caption: '08123456789',
///   onTap: () => _showMenu(customer),
/// )
/// ```
///
/// **Custom sections** — use topSection/bottomSection for complex layouts:
/// ```dart
/// QGridViewItem(
///   title: 'Table 1',
///   topSection: Icon(Icons.table_restaurant, size: 32),
///   bottomSection: Column(children: [Text('Table 1'), Text('4 seats')]),
///   onTap: () => _showMenu(table),
/// )
/// ```
class QGridViewItem extends StatelessWidget {
  final String? imageUrl;
  final IconData placeholderIcon;
  final Color? placeholderColor;
  final String? placeholderText;
  final String title;
  final String? subtitle;
  final Color? subtitleColor;
  final String? caption;
  final ItemBadge? badge;
  final Widget? topSection;
  final Widget? bottomSection;
  final VoidCallback? onTap;

  const QGridViewItem({
    super.key,
    this.imageUrl,
    this.placeholderIcon = Icons.image,
    this.placeholderColor,
    this.placeholderText,
    required this.title,
    this.subtitle,
    this.subtitleColor,
    this.caption,
    this.badge,
    this.topSection,
    this.bottomSection,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final hasImage = imageUrl != null && imageUrl!.isNotEmpty;

    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top section
          Expanded(
            flex: 3,
            child: topSection ??
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      hasImage
                          ? CachedNetworkImage(
                              imageUrl: imageUrl!,
                              fit: BoxFit.cover,
                              placeholder: (_, __) => Container(
                                color: Colors.grey[200],
                                child: const Center(
                                  child:
                                      CircularProgressIndicator(strokeWidth: 2),
                                ),
                              ),
                              errorWidget: (_, __, ___) => _Placeholder(
                                icon: placeholderIcon,
                                color: placeholderColor,
                              ),
                            )
                          : _Placeholder(
                              icon: placeholderIcon,
                              color: placeholderColor,
                              text: placeholderText,
                            ),
                      if (badge != null)
                        Positioned(
                          bottom: 4,
                          right: 4,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: badge!.color,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              badge!.label,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
          ),
          // Bottom section
          bottomSection ??
              Padding(
                padding: const EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style: TextStyle(
                          color: subtitleColor ?? Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    if (caption != null)
                      Text(
                        caption!,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 11,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}

/// Reusable list view item with image, title, subtitle, and caption.
///
/// Use for product list, customer list, supplier list, etc.
/// Supports optional image URL, placeholder icon, and trailing widget.
///
/// **Simple mode** — use imageUrl/title/subtitle/caption:
/// ```dart
/// QListViewItem(
///   imageUrl: product.photo,
///   placeholderIcon: Icons.inventory,
///   title: product.name,
///   subtitle: 'Rp 10,000',
///   subtitleColor: Colors.green,
///   caption: 'Stock: 5 | Category',
///   onTap: () => _showMenu(product),
/// )
/// ```
///
/// **Custom leading** — use leading for CircleAvatar or custom widget:
/// ```dart
/// QListViewItem(
///   leading: CircleAvatar(
///     backgroundColor: Colors.blue,
///     child: Icon(Icons.person, color: Colors.white),
///   ),
///   title: 'John Doe',
///   caption: '08123456789',
///   onTap: () => _showMenu(customer),
/// )
/// ```
///
/// **Custom content** — use content for complex layouts:
/// ```dart
/// QListViewItem(
///   leading: CircleAvatar(...),
///   title: '',
///   content: Column(children: [Text('Name'), Text('Amount')]),
///   trailing: Icon(Icons.chevron_right),
///   onTap: () => _showMenu(item),
/// )
/// ```
class QListViewItem extends StatelessWidget {
  final String? imageUrl;
  final IconData placeholderIcon;
  final double imageSize;
  final String title;
  final String? subtitle;
  final Color? subtitleColor;
  final String? caption;
  final Widget? leading;
  final Widget? content;
  final Widget? trailing;
  final VoidCallback? onTap;

  const QListViewItem({
    super.key,
    this.imageUrl,
    this.placeholderIcon = Icons.image,
    this.imageSize = 56,
    required this.title,
    this.subtitle,
    this.subtitleColor,
    this.caption,
    this.leading,
    this.content,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final hasImage = imageUrl != null && imageUrl!.isNotEmpty;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: rowOrColumnSpacing),
        child: Row(
          children: [
            // Leading section
            leading ??
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    width: imageSize,
                    height: imageSize,
                    child: hasImage
                        ? CachedNetworkImage(
                            imageUrl: imageUrl!,
                            fit: BoxFit.cover,
                            placeholder: (_, __) => Container(
                              color: Colors.grey[200],
                              child: const Center(
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child:
                                      CircularProgressIndicator(strokeWidth: 2),
                                ),
                              ),
                            ),
                            errorWidget: (_, __, ___) => _Placeholder(
                              icon: placeholderIcon,
                            ),
                          )
                        : _Placeholder(icon: placeholderIcon),
                  ),
                ),
            SizedBox(width: bodyPadding),
            // Content section
            Expanded(
              child: content ??
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      if (subtitle != null)
                        Text(
                          subtitle!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: subtitleColor ?? Colors.green,
                            fontSize: 13,
                          ),
                        ),
                      if (caption != null)
                        Text(
                          caption!,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
            ),
            // Trailing section
            trailing ?? const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final String? text;

  const _Placeholder({
    required this.icon,
    this.color,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Colors.grey[200],
      child: Center(
        child: text != null
            ? Text(
                text!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              )
            : Icon(icon, color: color != null ? Colors.white : Colors.grey),
      ),
    );
  }
}
