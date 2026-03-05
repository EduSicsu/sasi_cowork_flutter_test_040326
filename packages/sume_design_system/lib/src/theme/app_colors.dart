import 'package:flutter/material.dart';
import 'sume_primitives.dart';

/// Semantic color tokens for the SASI / Sumé Design System.
///
/// Maps Sumé primitives to meaningful roles. Each nested class represents
/// one theme mode — use [AppColors.light] or [AppColors.dark] to build a
/// [ColorScheme], or consume via `Theme.of(context).colorScheme`.
abstract final class AppColors {
  // ---------------------------------------------------------------------------
  // Light theme — Curupira (Light)
  // ---------------------------------------------------------------------------
  static const ColorScheme light = ColorScheme(
    brightness: Brightness.light,

    // Primary — Indigo
    primary: SumePrimitives.indigo600,
    onPrimary: SumePrimitives.indigo10,
    primaryContainer: SumePrimitives.indigo50,
    onPrimaryContainer: SumePrimitives.indigo800,
    primaryFixed: SumePrimitives.indigo50,
    primaryFixedDim: SumePrimitives.indigo200,
    onPrimaryFixed: SumePrimitives.indigo800,
    onPrimaryFixedVariant: SumePrimitives.indigo600,

    // Secondary — Green
    secondary: SumePrimitives.green700,
    onSecondary: SumePrimitives.green10,
    secondaryContainer: SumePrimitives.green100,
    onSecondaryContainer: SumePrimitives.green900,
    secondaryFixed: SumePrimitives.green100,
    secondaryFixedDim: SumePrimitives.green200,
    onSecondaryFixed: SumePrimitives.green900,
    onSecondaryFixedVariant: SumePrimitives.green700,

    // Tertiary — Yellow
    tertiary: SumePrimitives.yellow600,
    onTertiary: SumePrimitives.yellow10,
    tertiaryContainer: SumePrimitives.yellow100,
    onTertiaryContainer: SumePrimitives.yellow900,
    tertiaryFixed: SumePrimitives.yellow100,
    tertiaryFixedDim: SumePrimitives.yellow200,
    onTertiaryFixed: SumePrimitives.yellow900,
    onTertiaryFixedVariant: SumePrimitives.yellow600,

    // Error — Red
    error: SumePrimitives.red600,
    onError: SumePrimitives.red10,
    errorContainer: SumePrimitives.red100,
    onErrorContainer: SumePrimitives.red800,

    // Surface
    surface: SumePrimitives.indigo50,
    onSurface: SumePrimitives.indigo800,
    onSurfaceVariant: SumePrimitives.indigo600,
    surfaceTint: SumePrimitives.indigo600,
    surfaceBright: SumePrimitives.indigo10,
    surfaceDim: SumePrimitives.indigo100,
    surfaceContainerLowest: SumePrimitives.indigo10,
    surfaceContainerLow: SumePrimitives.indigo50,
    surfaceContainer: SumePrimitives.indigo100,
    surfaceContainerHigh: SumePrimitives.indigo200,
    surfaceContainerHighest: SumePrimitives.indigo10,

    // Inverse
    inverseSurface: SumePrimitives.indigo800,
    onInverseSurface: SumePrimitives.indigo10,
    inversePrimary: SumePrimitives.indigo600,

    // Neutral
    outline: SumePrimitives.gray300,
    outlineVariant: SumePrimitives.indigo100,
    shadow: SumePrimitives.pureBlack,
    scrim: SumePrimitives.pureBlack,
  );

  // ---------------------------------------------------------------------------
  // Dark theme — Curupira (Dark)
  // ---------------------------------------------------------------------------
  static const ColorScheme dark = ColorScheme(
    brightness: Brightness.dark,

    // Primary — Indigo
    primary: SumePrimitives.indigo300,
    onPrimary: SumePrimitives.indigo1000,
    primaryContainer: SumePrimitives.indigo800,
    onPrimaryContainer: SumePrimitives.indigo100,
    primaryFixed: SumePrimitives.indigo50,
    primaryFixedDim: SumePrimitives.indigo200,
    onPrimaryFixed: SumePrimitives.indigo800,
    onPrimaryFixedVariant: SumePrimitives.indigo600,

    // Secondary — Green
    secondary: SumePrimitives.green200,
    onSecondary: SumePrimitives.green1000,
    secondaryContainer: SumePrimitives.green900,
    onSecondaryContainer: SumePrimitives.green100,
    secondaryFixed: SumePrimitives.green100,
    secondaryFixedDim: SumePrimitives.green200,
    onSecondaryFixed: SumePrimitives.green900,
    onSecondaryFixedVariant: SumePrimitives.green700,

    // Tertiary — Yellow
    tertiary: SumePrimitives.yellow200,
    onTertiary: SumePrimitives.yellow1000,
    tertiaryContainer: SumePrimitives.yellow800,
    onTertiaryContainer: SumePrimitives.yellow100,
    tertiaryFixed: SumePrimitives.yellow100,
    tertiaryFixedDim: SumePrimitives.yellow200,
    onTertiaryFixed: SumePrimitives.yellow900,
    onTertiaryFixedVariant: SumePrimitives.yellow600,

    // Error — Red
    error: SumePrimitives.red300,
    onError: SumePrimitives.red1000,
    errorContainer: SumePrimitives.red800,
    onErrorContainer: SumePrimitives.red100,

    // Surface
    surface: SumePrimitives.indigo1000,
    onSurface: SumePrimitives.indigo100,
    onSurfaceVariant: SumePrimitives.indigo300,
    surfaceTint: SumePrimitives.indigo300,
    surfaceBright: SumePrimitives.indigo800,
    surfaceDim: SumePrimitives.indigo900,
    surfaceContainerLowest: SumePrimitives.indigo1000,
    surfaceContainerLow: SumePrimitives.indigo900,
    surfaceContainer: SumePrimitives.indigo800,
    surfaceContainerHigh: SumePrimitives.indigo900,
    surfaceContainerHighest: SumePrimitives.indigo900,

    // Inverse
    inverseSurface: SumePrimitives.indigo100,
    onInverseSurface: SumePrimitives.indigo1000,
    inversePrimary: SumePrimitives.indigo300,

    // Neutral
    outline: SumePrimitives.indigo300,
    outlineVariant: SumePrimitives.indigo700,
    shadow: SumePrimitives.pureBlack,
    scrim: SumePrimitives.pureBlack,
  );
}
