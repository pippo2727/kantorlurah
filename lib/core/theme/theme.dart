import 'package:flutter/material.dart';

// Global color constants (use these instead of hardcoded colors)
const Color primaryColor = Color(0xff4BA138);
const Color secondaryColor = Color(0xff2D5524);
const Color successColor = Colors.green;
const Color infoColor = Colors.blue;
const Color warningColor = Colors.orange;
const Color dangerColor = Colors.red;
const Color disabledColor = Colors.grey;

// Semantic text colors — use these instead of Colors.grey[xxx] for readable text
/// Almost black — for primary content text, titles, body text
const Color textPrimaryColor = Color(0xFF1A1A1A);

/// Dark grey — for secondary/supporting text, subtitles
const Color textSecondaryColor = Color(0xFF4A4A4A);

/// Medium-dark grey — for muted text, captions, labels, icons
const Color textMutedColor = Color(0xFF6B6B6B);

/// Medium grey — for hints, placeholders, disabled text/icons
const Color textHintColor = Color(0xFF8C8C8C);

const double formFieldRadius = 8.0;

final double bodyPadding = 12.0;
final double rowOrColumnSpacing = 8.0;
final double gridSpacing = 8.0;

final EdgeInsets defaultFormWidgetPadding = const EdgeInsets.symmetric(
  horizontal: 8,
  vertical: 12,
);
final double defaultFormFieldFontSize = 14.0;
final double defaultFormFieldIconSize = 14.0;

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        // Display
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: textPrimaryColor),
        displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: textPrimaryColor),
        displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textPrimaryColor),
        // Headline
        headlineLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: textPrimaryColor),
        headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: textPrimaryColor),
        headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: textPrimaryColor),
        // Title
        titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: textPrimaryColor),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: textPrimaryColor),
        titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textPrimaryColor),
        // Body
        bodyLarge: TextStyle(fontSize: 16, color: textPrimaryColor),
        bodyMedium: TextStyle(fontSize: 14, color: textPrimaryColor),
        bodySmall: TextStyle(fontSize: 12, color: textSecondaryColor),
        // Label
        labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textSecondaryColor),
        labelMedium: TextStyle(fontSize: 12, color: textMutedColor),
        labelSmall: TextStyle(fontSize: 10, color: textMutedColor),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actionsIconTheme: const IconThemeData(color: Colors.white),
      ),
      tabBarTheme: const TabBarThemeData(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,
      ),
      cardTheme: CardThemeData(
        elevation: 0.6,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: secondaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: BorderSide(color: secondaryColor),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: secondaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(formFieldRadius),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(formFieldRadius),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(formFieldRadius),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        contentPadding: defaultFormWidgetPadding,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: secondaryColor,
        unselectedItemColor: Colors.grey.shade500,
        type: BottomNavigationBarType.fixed,
      ),
      dividerTheme: DividerThemeData(color: Colors.grey.shade200, thickness: 1),
      chipTheme: ChipThemeData(
        backgroundColor: Colors.grey.shade100,
        selectedColor: secondaryColor,
        labelStyle: const TextStyle(fontSize: 13),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  // Spacing
  static const double bodyPadding = 8.0;
  static const double sectionSpacing = 12.0;
  static const double cardPadding = 16.0;
  static const double cardSpacing = 12.0;

  // CircleAvatar radius (for list items)
  static const double listAvatarRadius = 20.0;
  static const double smallAvatarRadius = 16.0;
  static const double largeAvatarRadius = 24.0;

  // ============================================
  // Responsive Typography & Sizing Utilities
  // ============================================

  /// Get responsive values based on screen width
  /// Usage: AppTheme.responsive(context, mobile: 14, tablet: 16, desktop: 18)
  static double responsive(
    BuildContext context, {
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1024) return desktop ?? tablet ?? mobile;
    if (width >= 600) return tablet ?? mobile;
    return mobile;
  }

  /// Check if device is tablet (width >= 600)
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;

  /// Check if device is desktop (width >= 1024)
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  // ---- Responsive Font Sizes ----

  /// Display/Hero text (e.g., big numbers, headers)
  static double displaySize(BuildContext context) =>
      responsive(context, mobile: 28, tablet: 32, desktop: 36);

  /// Page title (e.g., form titles, section headers)
  static double titleSize(BuildContext context) =>
      responsive(context, mobile: 20, tablet: 22, desktop: 24);

  /// Subtitle/Section header
  static double subtitleSize(BuildContext context) =>
      responsive(context, mobile: 16, tablet: 17, desktop: 18);

  /// Body text (default readable text)
  static double bodySize(BuildContext context) =>
      responsive(context, mobile: 14, tablet: 15, desktop: 16);

  /// Caption/Label (small helper text)
  static double captionSize(BuildContext context) =>
      responsive(context, mobile: 12, tablet: 13, desktop: 14);

  /// Small text (badges, chips, very small labels)
  static double smallSize(BuildContext context) =>
      responsive(context, mobile: 10, tablet: 11, desktop: 12);

  // ---- Responsive Icon Sizes ----

  /// Large icon (e.g., empty state, hero icons)
  static double iconLarge(BuildContext context) =>
      responsive(context, mobile: 48, tablet: 56, desktop: 64);

  /// Medium icon (e.g., list leading, card icons)
  static double iconMedium(BuildContext context) =>
      responsive(context, mobile: 24, tablet: 28, desktop: 32);

  /// Small icon (e.g., inline icons, button icons)
  static double iconSmall(BuildContext context) =>
      responsive(context, mobile: 18, tablet: 20, desktop: 22);

  // ---- Responsive Padding/Spacing ----

  /// Horizontal padding for screen body
  static double horizontalPadding(BuildContext context) =>
      responsive(context, mobile: 16, tablet: 24, desktop: 32);

  /// Vertical padding for screen body
  static double verticalPadding(BuildContext context) =>
      responsive(context, mobile: 16, tablet: 20, desktop: 24);

  /// Content max width (for centering on large screens)
  static double contentMaxWidth(BuildContext context) =>
      responsive(context, mobile: double.infinity, tablet: 600, desktop: 800);

  // ---- Responsive Button/Input Heights ----

  /// Button height
  static double buttonHeight(BuildContext context) =>
      responsive(context, mobile: 48, tablet: 52, desktop: 56);

  /// Input field height
  static double inputHeight(BuildContext context) =>
      responsive(context, mobile: 48, tablet: 52, desktop: 56);
}
