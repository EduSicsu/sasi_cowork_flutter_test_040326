import 'package:flutter/material.dart';

/// Moni / Sumé DS type scale built on the Inter font family.
///
/// All sizes and weights come from the Figma documentation table
/// "Title and description" (node 8752-605). Slots not listed in the Figma
/// (titleLarge, titleMedium, titleSmall, bodyMedium, displayMedium,
/// displaySmall) are derived from Material 3 conventions while matching
/// the Moni weight and letter-spacing preferences.
///
/// Three custom bold variants documented in the Figma but absent from the
/// M3 TextTheme spec are exposed as static [TextStyle] constants:
/// [labelSmallBold], [labelMediumBold], [bodySmallBold].
///
/// To activate Inter, add it as a local asset or via `google_fonts`:
/// ```yaml
/// flutter:
///   fonts:
///     - family: Inter
///       fonts:
///         - asset: fonts/Inter-Regular.ttf
///         - asset: fonts/Inter-Medium.ttf   weight: 500
///         - asset: fonts/Inter-SemiBold.ttf weight: 600
///         - asset: fonts/Inter-Bold.ttf     weight: 700
/// ```
abstract final class AppTypography {
  static const String _fontFamily = 'Inter';

  // ---------------------------------------------------------------------------
  // M3 TextTheme
  // ---------------------------------------------------------------------------

  /// Full [TextTheme] using the Moni type scale.
  ///
  /// Sizes, weights, and line heights for documented slots:
  ///
  /// | Slot            | Size | Weight | lh   |
  /// |-----------------|------|--------|------|
  /// | displayLarge    | 64pt | w700   | 1.13 |
  /// | headlineLarge   | 48pt | w700   | 1.17 |
  /// | headlineMedium  | 32pt | w700   | 1.25 |
  /// | headlineSmall   | 24pt | w700   | 1.33 |
  /// | bodyLarge       | 16pt | w400   | 1.50 |
  /// | labelLarge      | 16pt | w700   | 1.00 |
  /// | bodySmall       | 14pt | w400   | 1.14 |
  /// | labelMedium     | 14pt | w400   | 1.14 |
  /// | labelSmall      | 12pt | w400   | 1.33 |
  static const TextTheme textTheme = TextTheme(
    // -------------------------------------------------------------------------
    // Display
    // -------------------------------------------------------------------------

    /// 64pt · w700 · lh 72/64 — Figma: displayLarge
    displayLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 64,
      height: 72 / 64,
      letterSpacing: 0,
      fontWeight: FontWeight.w700,
    ),

    /// 57pt · w700 — derived (between headlineLarge 48pt and displayLarge 64pt)
    displayMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 57,
      height: 64 / 57,
      letterSpacing: 0,
      fontWeight: FontWeight.w700,
    ),

    /// 52pt · w700 — derived (above headlineLarge 48pt)
    displaySmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 52,
      height: 60 / 52,
      letterSpacing: 0,
      fontWeight: FontWeight.w700,
    ),

    // -------------------------------------------------------------------------
    // Headline
    // -------------------------------------------------------------------------

    /// 48pt · w700 · lh 56/48 — Figma: headlineLarge
    headlineLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 48,
      height: 56 / 48,
      letterSpacing: 0,
      fontWeight: FontWeight.w700,
    ),

    /// 32pt · w700 · lh 40/32 — Figma: headlineMedium
    headlineMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 32,
      height: 40 / 32,
      letterSpacing: 0,
      fontWeight: FontWeight.w700,
    ),

    /// 24pt · w700 · lh 32/24 — Figma: headlineSmall
    headlineSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 24,
      height: 32 / 24,
      letterSpacing: 0,
      fontWeight: FontWeight.w700,
    ),

    // -------------------------------------------------------------------------
    // Title  (not in Figma table — derived from M3 with Moni adjustments)
    // -------------------------------------------------------------------------

    /// 22pt · w600 · lh 28/22 — derived
    titleLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 22,
      height: 28 / 22,
      letterSpacing: 0,
      fontWeight: FontWeight.w600,
    ),

    /// 16pt · w500 · lh 24/16 — derived
    titleMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16,
      height: 24 / 16,
      letterSpacing: 0,
      fontWeight: FontWeight.w500,
    ),

    /// 14pt · w500 · lh 20/14 — derived
    titleSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: 0,
      fontWeight: FontWeight.w500,
    ),

    // -------------------------------------------------------------------------
    // Body
    // -------------------------------------------------------------------------

    /// 16pt · w400 · lh 24/16 — Figma: bodyLarge
    bodyLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16,
      height: 24 / 16,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),

    /// 14pt · w400 · lh 20/14 — derived (same size as bodySmall, extra leading)
    bodyMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),

    /// 14pt · w400 · lh 16/14 — Figma: bodySmall
    bodySmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      height: 16 / 14,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),

    // -------------------------------------------------------------------------
    // Label
    // -------------------------------------------------------------------------

    /// 16pt · w700 · lh 16/16 — Figma: labelLarge
    labelLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16,
      height: 1,
      letterSpacing: 0,
      fontWeight: FontWeight.w700,
    ),

    /// 14pt · w400 · lh 16/14 — Figma: labelMedium
    labelMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      height: 16 / 14,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),

    /// 12pt · w400 · lh 16/12 — Figma: labelSmall
    labelSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12,
      height: 16 / 12,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),
  );

  // ---------------------------------------------------------------------------
  // Custom bold variants (documented in Figma, outside M3 TextTheme slots)
  // ---------------------------------------------------------------------------

  /// 12pt · w700 · lh 16/12 — Figma: labelSmallBold
  static const TextStyle labelSmallBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    height: 16 / 12,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
  );

  /// 14pt · w700 · lh 16/14 — Figma: labelMediumBold
  static const TextStyle labelMediumBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    height: 16 / 14,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
  );

  /// 14pt · w700 · lh 16/14 — Figma: bodySmallBold
  static const TextStyle bodySmallBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    height: 16 / 14,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
  );
}
