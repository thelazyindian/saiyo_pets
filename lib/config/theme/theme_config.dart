import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saiyo_pets/constants/colors.dart';

class ThemeConfig {
  const ThemeConfig._();

  static ThemeData getLightTheme(BuildContext context) => ThemeData(
        textTheme:
            GoogleFonts.latoTextTheme(Theme.of(context).textTheme).copyWith(
          titleMedium: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.primary,
          onPrimary: AppColors.onPrimary,
          primaryContainer: AppColors.primaryContainer,
          onPrimaryContainer: AppColors.onPrimaryContainer,
          secondary: AppColors.secondary,
          onSecondary: AppColors.onSecondary,
          secondaryContainer: AppColors.secondaryContainer,
          error: AppColors.error,
          onError: AppColors.onError,
          background: AppColors.background,
          onBackground: AppColors.onBackground,
          surface: AppColors.background,
          onSurface: AppColors.onBackground,
          outline: Colors.grey.shade200,
          tertiary: AppColors.tertiary,
          onTertiary: AppColors.onTertiary,
        ),
      );

  static ThemeData getDarkTheme(BuildContext context) => ThemeData(
        textTheme:
            GoogleFonts.latoTextTheme(Theme.of(context).textTheme).copyWith(
          titleMedium: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: AppColors.primaryDark,
          onPrimary: AppColors.onPrimary,
          primaryContainer: AppColors.primaryContainerDark,
          onPrimaryContainer: AppColors.onPrimaryContainerDark,
          secondary: AppColors.secondaryDark,
          onSecondary: AppColors.onSecondaryDark,
          secondaryContainer: AppColors.secondaryContainerDark,
          error: AppColors.errorDark,
          onError: AppColors.onErrorDark,
          background: AppColors.backgroundDark,
          onBackground: AppColors.onBackgroundDark,
          surface: AppColors.backgroundDark,
          onSurface: AppColors.onBackgroundDark,
          outline: Colors.grey.shade800,
          tertiary: AppColors.tertiaryDark,
          onTertiary: AppColors.onTertiaryDark,
        ),
      );
}
