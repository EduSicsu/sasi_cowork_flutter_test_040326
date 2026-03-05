import 'package:flutter/material.dart';
import 'sume_primitives.dart';

/// SASI / Sumé DS tokens that go beyond the standard M3 [ColorScheme].
///
/// Access via:
/// ```dart
/// final ext = Theme.of(context).extension<SumeThemeExtension>()!;
/// ```
@immutable
class SumeThemeExtension extends ThemeExtension<SumeThemeExtension> {
  const SumeThemeExtension({
    required this.textPrimary,
    required this.textPositive,
    required this.textNegative,
    required this.textSubtitle,
    required this.textDisabled,
    required this.textOnTitle,
    required this.bgError,
    required this.bgErrorSubtle,
    required this.bgErrorSubtlePressed,
    required this.bgErrorTonalContainer,
    required this.bgPrimaryPressed,
    required this.bgTertiarySubtle,
    required this.outlinePrimary,
    required this.outlineSubtle,
    required this.subtle,
    required this.surfaceDimColor,
    required this.fillOnSurface,
    required this.fillOnSurfaceVariant,
    required this.fillOnInverseSurface,
    required this.fillOnPrimary,
    required this.fillError,
    required this.statusSuccess,
    required this.statusWarning,
    required this.statusInfo,
    required this.statusNeutral,
  });

  // ---------------------------------------------------------------------------
  // Text colors (beyond onSurface / onSurfaceVariant)
  // ---------------------------------------------------------------------------

  /// CTA / link / action text — bright Sumé blue (Primary-500).
  final Color textPrimary;

  /// Positive / success text — green.
  final Color textPositive;

  /// Negative / danger text — red (same hue as [ColorScheme.error]).
  final Color textNegative;

  /// Secondary-level text (subtitles, captions).
  final Color textSubtitle;

  /// Text on disabled controls.
  final Color textDisabled;

  /// High-contrast heading text (on top of the title bar).
  final Color textOnTitle;

  // ---------------------------------------------------------------------------
  // Background colors
  // ---------------------------------------------------------------------------

  /// Filled error/danger surface (stronger than [ColorScheme.errorContainer]).
  final Color bgError;

  /// Subtle error tint background.
  final Color bgErrorSubtle;

  /// Subtle error tint — pressed state.
  final Color bgErrorSubtlePressed;

  /// Light tonal error container — default state of a "Tonal Danger" button.
  /// Extracted from the Figma button component (#FCEAE7 light / errorContainer dark).
  final Color bgErrorTonalContainer;

  /// Primary action background — pressed state.
  final Color bgPrimaryPressed;

  /// Subtle gray/neutral tertiary background.
  final Color bgTertiarySubtle;

  // ---------------------------------------------------------------------------
  // Outline / border colors
  // ---------------------------------------------------------------------------

  /// Primary-colored border (matches [ColorScheme.primary]).
  final Color outlinePrimary;

  /// Low-emphasis border / divider.
  final Color outlineSubtle;

  // ---------------------------------------------------------------------------
  // Miscellaneous
  // ---------------------------------------------------------------------------

  /// Subtle accent overlay (low-saturation primary tint).
  final Color subtle;

  /// Dimmed surface — used for scrims or secondary backgrounds.
  final Color surfaceDimColor;

  // ---------------------------------------------------------------------------
  // Icon fill colors
  // ---------------------------------------------------------------------------
  final Color fillOnSurface;
  final Color fillOnSurfaceVariant;
  final Color fillOnInverseSurface;
  final Color fillOnPrimary;
  final Color fillError;

  // ---------------------------------------------------------------------------
  // Status indicator colors (used in badges, chips, tags)
  // ---------------------------------------------------------------------------
  final Color statusSuccess;
  final Color statusWarning;
  final Color statusInfo;
  final Color statusNeutral;

  // ---------------------------------------------------------------------------
  // Predefined instances
  // ---------------------------------------------------------------------------

  static const SumeThemeExtension light = SumeThemeExtension(
    textPrimary: SumePrimitives.primary500,
    textPositive: SumePrimitives.green500,
    textNegative: SumePrimitives.red600,
    textSubtitle: SumePrimitives.gray600,
    textDisabled: SumePrimitives.indigo200,
    textOnTitle: SumePrimitives.pureBlack,

    bgError: SumePrimitives.red500,
    bgErrorSubtle: SumePrimitives.red100,
    bgErrorSubtlePressed: SumePrimitives.red100,
    bgErrorTonalContainer: Color(0xFFFCEAE7), // Figma: Tonal Danger button default bg
    bgPrimaryPressed: SumePrimitives.primary700,
    bgTertiarySubtle: SumePrimitives.gray100,

    outlinePrimary: SumePrimitives.indigo600,
    outlineSubtle: SumePrimitives.indigo100,

    subtle: SumePrimitives.indigo300,
    surfaceDimColor: Color(0x99C3C9E8), // Indigo-100 @ 60 %

    fillOnSurface: SumePrimitives.indigo800,
    fillOnSurfaceVariant: SumePrimitives.gray500,
    fillOnInverseSurface: SumePrimitives.gray700,
    fillOnPrimary: SumePrimitives.gray10,
    fillError: SumePrimitives.red500,

    statusSuccess: SumePrimitives.green500,
    statusWarning: SumePrimitives.yellow600,
    statusInfo: SumePrimitives.blue600,
    statusNeutral: SumePrimitives.gray500,
  );

  static const SumeThemeExtension dark = SumeThemeExtension(
    textPrimary: SumePrimitives.primary400,
    textPositive: SumePrimitives.green200,
    textNegative: SumePrimitives.red300,
    textSubtitle: SumePrimitives.gray300,
    textDisabled: SumePrimitives.indigo600,
    textOnTitle: SumePrimitives.pureWhite,

    bgError: SumePrimitives.red300,
    bgErrorSubtle: SumePrimitives.red800,
    bgErrorSubtlePressed: SumePrimitives.red800,
    bgErrorTonalContainer: SumePrimitives.red800,
    bgPrimaryPressed: SumePrimitives.primary400,
    bgTertiarySubtle: SumePrimitives.gray800,

    outlinePrimary: SumePrimitives.indigo300,
    outlineSubtle: SumePrimitives.indigo700,

    subtle: SumePrimitives.indigo600,
    surfaceDimColor: SumePrimitives.indigo900,

    fillOnSurface: SumePrimitives.gray700,
    fillOnSurfaceVariant: SumePrimitives.gray500,
    fillOnInverseSurface: SumePrimitives.gray700,
    fillOnPrimary: SumePrimitives.gray1000,
    fillError: SumePrimitives.red300,

    statusSuccess: SumePrimitives.green200,
    statusWarning: SumePrimitives.yellow200,
    statusInfo: SumePrimitives.blue300,
    statusNeutral: SumePrimitives.gray300,
  );

  // ---------------------------------------------------------------------------
  // ThemeExtension overrides
  // ---------------------------------------------------------------------------

  @override
  SumeThemeExtension copyWith({
    Color? textPrimary,
    Color? textPositive,
    Color? textNegative,
    Color? textSubtitle,
    Color? textDisabled,
    Color? textOnTitle,
    Color? bgError,
    Color? bgErrorSubtle,
    Color? bgErrorSubtlePressed,
    Color? bgErrorTonalContainer,
    Color? bgPrimaryPressed,
    Color? bgTertiarySubtle,
    Color? outlinePrimary,
    Color? outlineSubtle,
    Color? subtle,
    Color? surfaceDimColor,
    Color? fillOnSurface,
    Color? fillOnSurfaceVariant,
    Color? fillOnInverseSurface,
    Color? fillOnPrimary,
    Color? fillError,
    Color? statusSuccess,
    Color? statusWarning,
    Color? statusInfo,
    Color? statusNeutral,
  }) {
    return SumeThemeExtension(
      textPrimary: textPrimary ?? this.textPrimary,
      textPositive: textPositive ?? this.textPositive,
      textNegative: textNegative ?? this.textNegative,
      textSubtitle: textSubtitle ?? this.textSubtitle,
      textDisabled: textDisabled ?? this.textDisabled,
      textOnTitle: textOnTitle ?? this.textOnTitle,
      bgError: bgError ?? this.bgError,
      bgErrorSubtle: bgErrorSubtle ?? this.bgErrorSubtle,
      bgErrorSubtlePressed: bgErrorSubtlePressed ?? this.bgErrorSubtlePressed,
      bgErrorTonalContainer: bgErrorTonalContainer ?? this.bgErrorTonalContainer,
      bgPrimaryPressed: bgPrimaryPressed ?? this.bgPrimaryPressed,
      bgTertiarySubtle: bgTertiarySubtle ?? this.bgTertiarySubtle,
      outlinePrimary: outlinePrimary ?? this.outlinePrimary,
      outlineSubtle: outlineSubtle ?? this.outlineSubtle,
      subtle: subtle ?? this.subtle,
      surfaceDimColor: surfaceDimColor ?? this.surfaceDimColor,
      fillOnSurface: fillOnSurface ?? this.fillOnSurface,
      fillOnSurfaceVariant: fillOnSurfaceVariant ?? this.fillOnSurfaceVariant,
      fillOnInverseSurface: fillOnInverseSurface ?? this.fillOnInverseSurface,
      fillOnPrimary: fillOnPrimary ?? this.fillOnPrimary,
      fillError: fillError ?? this.fillError,
      statusSuccess: statusSuccess ?? this.statusSuccess,
      statusWarning: statusWarning ?? this.statusWarning,
      statusInfo: statusInfo ?? this.statusInfo,
      statusNeutral: statusNeutral ?? this.statusNeutral,
    );
  }

  @override
  SumeThemeExtension lerp(SumeThemeExtension? other, double t) {
    if (other == null) return this;
    return SumeThemeExtension(
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textPositive: Color.lerp(textPositive, other.textPositive, t)!,
      textNegative: Color.lerp(textNegative, other.textNegative, t)!,
      textSubtitle: Color.lerp(textSubtitle, other.textSubtitle, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      textOnTitle: Color.lerp(textOnTitle, other.textOnTitle, t)!,
      bgError: Color.lerp(bgError, other.bgError, t)!,
      bgErrorSubtle: Color.lerp(bgErrorSubtle, other.bgErrorSubtle, t)!,
      bgErrorSubtlePressed:
          Color.lerp(bgErrorSubtlePressed, other.bgErrorSubtlePressed, t)!,
      bgErrorTonalContainer:
          Color.lerp(bgErrorTonalContainer, other.bgErrorTonalContainer, t)!,
      bgPrimaryPressed:
          Color.lerp(bgPrimaryPressed, other.bgPrimaryPressed, t)!,
      bgTertiarySubtle:
          Color.lerp(bgTertiarySubtle, other.bgTertiarySubtle, t)!,
      outlinePrimary: Color.lerp(outlinePrimary, other.outlinePrimary, t)!,
      outlineSubtle: Color.lerp(outlineSubtle, other.outlineSubtle, t)!,
      subtle: Color.lerp(subtle, other.subtle, t)!,
      surfaceDimColor: Color.lerp(surfaceDimColor, other.surfaceDimColor, t)!,
      fillOnSurface: Color.lerp(fillOnSurface, other.fillOnSurface, t)!,
      fillOnSurfaceVariant:
          Color.lerp(fillOnSurfaceVariant, other.fillOnSurfaceVariant, t)!,
      fillOnInverseSurface:
          Color.lerp(fillOnInverseSurface, other.fillOnInverseSurface, t)!,
      fillOnPrimary: Color.lerp(fillOnPrimary, other.fillOnPrimary, t)!,
      fillError: Color.lerp(fillError, other.fillError, t)!,
      statusSuccess: Color.lerp(statusSuccess, other.statusSuccess, t)!,
      statusWarning: Color.lerp(statusWarning, other.statusWarning, t)!,
      statusInfo: Color.lerp(statusInfo, other.statusInfo, t)!,
      statusNeutral: Color.lerp(statusNeutral, other.statusNeutral, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SumeThemeExtension &&
        other.textPrimary == textPrimary &&
        other.textPositive == textPositive &&
        other.textNegative == textNegative &&
        other.textSubtitle == textSubtitle &&
        other.textDisabled == textDisabled &&
        other.textOnTitle == textOnTitle &&
        other.bgError == bgError &&
        other.bgErrorSubtle == bgErrorSubtle &&
        other.bgErrorSubtlePressed == bgErrorSubtlePressed &&
        other.bgErrorTonalContainer == bgErrorTonalContainer &&
        other.bgPrimaryPressed == bgPrimaryPressed &&
        other.bgTertiarySubtle == bgTertiarySubtle &&
        other.outlinePrimary == outlinePrimary &&
        other.outlineSubtle == outlineSubtle &&
        other.subtle == subtle &&
        other.surfaceDimColor == surfaceDimColor &&
        other.fillOnSurface == fillOnSurface &&
        other.fillOnSurfaceVariant == fillOnSurfaceVariant &&
        other.fillOnInverseSurface == fillOnInverseSurface &&
        other.fillOnPrimary == fillOnPrimary &&
        other.fillError == fillError &&
        other.statusSuccess == statusSuccess &&
        other.statusWarning == statusWarning &&
        other.statusInfo == statusInfo &&
        other.statusNeutral == statusNeutral;
  }

  @override
  int get hashCode => Object.hashAll([
        textPrimary,
        textPositive,
        textNegative,
        textSubtitle,
        textDisabled,
        textOnTitle,
        bgError,
        bgErrorSubtle,
        bgErrorSubtlePressed,
        bgErrorTonalContainer,
        bgPrimaryPressed,
        bgTertiarySubtle,
        outlinePrimary,
        outlineSubtle,
        subtle,
        surfaceDimColor,
        fillOnSurface,
        fillOnSurfaceVariant,
        fillOnInverseSurface,
        fillOnPrimary,
        fillError,
        statusSuccess,
        statusWarning,
        statusInfo,
        statusNeutral,
      ]);
}
