import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kantor_lurah/core/theme/theme.dart';

/// Tag badge data for [ListCartItem].
///
/// Used to display variant selections, notes, reason chips, etc.
/// ```dart
/// CartItemTag(label: 'Size: L', color: Colors.blue)
/// CartItemTag(label: 'Extra spicy', icon: Icons.note_outlined, color: Colors.amber)
/// ```
class CartItemTag {
  /// Tag label text
  final String label;

  /// Optional leading icon
  final IconData? icon;

  /// Tag color — used for icon tint, text color, and a subtle background
  final Color color;

  const CartItemTag({
    required this.label,
    this.icon,
    required this.color,
  });
}

/// A professional, elegant cart item card for use in cart views.
///
/// Provides consistent styling across POS, Purchase Order, and
/// Stock Adjustment cart views with:
/// - Subtle card with rounded corners and shadow
/// - Product image with placeholder fallback
/// - Product name with clean typography
/// - Flexible [content] area for price/info
/// - Standardized [tags] rendering
/// - Trailing widget (typically [ListQtyUpdater])
/// - Optional swipe-to-delete via [onDismissed]
///
/// Example (POS cart):
/// ```dart
/// ListCartItem(
///   imageUrl: product.photo,
///   productName: item.productName,
///   content: Text('2 PCS x Rp 10,000'),
///   tags: [
///     CartItemTag(label: 'Size: L', color: Colors.blue),
///     CartItemTag(label: 'Extra spicy', icon: Icons.note_outlined, color: Colors.amber),
///   ],
///   trailing: ListQtyUpdater(...),
///   onTap: () => _editItem(),
/// )
/// ```
class ListCartItem extends StatelessWidget {
  /// Product image URL (optional)
  final String? imageUrl;

  /// Placeholder icon when image is unavailable
  final IconData placeholderIcon;

  /// Image container size (width & height)
  final double? imageSize;

  /// Product name displayed as the card title
  final String productName;

  /// Custom content widget below product name.
  ///
  /// Use for price lines, subtotal, cost info, etc.
  /// Each cart view can provide its own layout here.
  final Widget? content;

  /// Tags displayed below content (variant, note, reason, etc.)
  final List<CartItemTag> tags;

  /// Trailing widget — typically [ListQtyUpdater]
  final Widget trailing;

  /// Callback when the card is tapped
  final VoidCallback? onTap;

  /// Callback when swiped to delete. If null, swipe is disabled.
  final VoidCallback? onDismissed;

  /// Key for [Dismissible] widget. Required when [onDismissed] is provided.
  final Key? dismissKey;

  /// Whether to show the product image. When false, the image section is hidden entirely.
  final bool showImage;

  const ListCartItem({
    super.key,
    this.imageUrl,
    this.placeholderIcon = Icons.inventory_2,
    this.imageSize,
    required this.productName,
    this.content,
    this.tags = const [],
    required this.trailing,
    this.onTap,
    this.onDismissed,
    this.dismissKey,
    this.showImage = true,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;
    final hasImage = imageUrl != null && imageUrl!.isNotEmpty;
    final imgSize = imageSize ?? (isTablet ? 60.0 : 52.0);

    Widget card = Container(
      margin: EdgeInsets.only(bottom: rowOrColumnSpacing + 2),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.withValues(alpha: 0.12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 14 : 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Product image
                if (showImage) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: imgSize,
                      height: imgSize,
                      child: hasImage
                          ? CachedNetworkImage(
                              imageUrl: imageUrl!,
                              fit: BoxFit.cover,
                              placeholder: (_, __) => Container(
                                color: Colors.grey[100],
                                child: const Center(
                                  child: SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  ),
                                ),
                              ),
                              errorWidget: (_, __, ___) =>
                                  _buildPlaceholder(imgSize),
                            )
                          : _buildPlaceholder(imgSize),
                    ),
                  ),
                  SizedBox(width: isTablet ? 14 : 12),
                ],

                // Content section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Product name
                      Text(
                        productName,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: isTablet ? 15 : 14,
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (content != null) ...[
                        const SizedBox(height: 6),
                        content!,
                      ],
                      if (tags.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 6,
                          runSpacing: 4,
                          children: tags.map(_buildTag).toList(),
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(width: isTablet ? 10 : 6),

                // Trailing
                trailing,
              ],
            ),
          ),
        ),
      ),
    );

    // Wrap with Dismissible if onDismissed callback is provided
    if (onDismissed != null) {
      card = Dismissible(
        key: dismissKey ?? ValueKey(productName),
        direction: DismissDirection.endToStart,
        onDismissed: (_) => onDismissed!(),
        background: Container(
          margin: EdgeInsets.only(bottom: rowOrColumnSpacing + 2),
          decoration: BoxDecoration(
            color: dangerColor,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 24),
          child: const Icon(
            Icons.delete_outline,
            color: Colors.white,
            size: 28,
          ),
        ),
        child: card,
      );
    }

    return card;
  }

  Widget _buildPlaceholder(double size) {
    return Container(
      color: Colors.grey[100],
      child: Center(
        child: Icon(
          placeholderIcon,
          color: Colors.grey[350],
          size: size * 0.45,
        ),
      ),
    );
  }

  Widget _buildTag(CartItemTag tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: tag.color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (tag.icon != null) ...[
            Icon(tag.icon, size: 12, color: tag.color),
            const SizedBox(width: 4),
          ],
          Flexible(
            child: Text(
              tag.label,
              style: TextStyle(
                fontSize: 11,
                color: tag.color,
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

/// Inline price + subtotal row for cart items.
///
/// Shows "{quantityText}" on the left and "{subtotalText}" on the right,
/// both with [FittedBox] to prevent overflow.
///
/// ```dart
/// CartItemPriceRow(
///   quantityText: '2 PCS × Rp 10,000',
///   subtotalText: 'Rp 20,000',
///   subtotalColor: primaryColor,
/// )
/// ```
class CartItemPriceRow extends StatelessWidget {
  /// Left side text showing qty × price detail
  final String quantityText;

  /// Right side text showing subtotal
  final String subtotalText;

  /// Color for subtotal text
  final Color? subtotalColor;

  /// Whether subtotal text is bold
  final bool subtotalBold;

  const CartItemPriceRow({
    super.key,
    required this.quantityText,
    required this.subtotalText,
    this.subtotalColor,
    this.subtotalBold = true,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;

    return Row(
      children: [
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              quantityText,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: isTablet ? 13 : 12,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerRight,
            child: Text(
              subtotalText,
              style: TextStyle(
                fontWeight: subtotalBold ? FontWeight.w600 : FontWeight.normal,
                fontSize: isTablet ? 14 : 13,
                color: subtotalColor ?? primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Editable price line for cart items (e.g. in Purchase Order cart).
///
/// Shows price text with an edit icon, and triggers [onTap] when tapped.
///
/// ```dart
/// CartItemEditablePrice(
///   priceText: 'Rp 5,000/DUS',
///   onTap: () => _showPriceInput(...),
/// )
/// ```
class CartItemEditablePrice extends StatelessWidget {
  /// Formatted price text
  final String priceText;

  /// Tap callback to edit the price
  final VoidCallback? onTap;

  /// Text color
  final Color? color;

  const CartItemEditablePrice({
    super.key,
    required this.priceText,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;

    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              priceText,
              style: TextStyle(
                color: color ?? primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: isTablet ? 14 : 13,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 6),
          Icon(
            Icons.edit_outlined,
            size: 14,
            color: Colors.grey[400],
          ),
        ],
      ),
    );
  }
}

/// Small info badge for cart items (e.g. unit + stock info).
///
/// ```dart
/// CartItemInfoBadge(
///   text: 'PCS · Stock: 24',
///   color: Colors.blue,
/// )
/// ```
class CartItemInfoBadge extends StatelessWidget {
  /// Badge text
  final String text;

  /// Badge color
  final Color color;

  const CartItemInfoBadge({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
