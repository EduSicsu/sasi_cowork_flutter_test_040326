import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_tokens.dart';

abstract final class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: AppColors.white,
        cardTheme: CardThemeData(
          elevation: AppTokens.elevationSm,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTokens.radiusMd),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: AppTokens.elevationNone,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: AppTokens.fontDisplay, color: AppColors.grey800),
          titleLarge: TextStyle(fontSize: AppTokens.fontXxl, color: AppColors.grey800),
          bodyLarge: TextStyle(fontSize: AppTokens.fontLg, color: AppColors.grey800),
          bodyMedium: TextStyle(fontSize: AppTokens.fontMd, color: AppColors.grey600),
          labelSmall: TextStyle(fontSize: AppTokens.fontSm, color: AppColors.grey400),
        ),
      );

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: AppColors.primaryDark,
      );
}
