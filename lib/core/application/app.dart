import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saiyo_pets/constants/app_strings.dart';
import 'package:saiyo_pets/constants/colors.dart';
import 'package:saiyo_pets/presentation/base.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: ThemeData(
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
      ),
      home: const BasePage(),
    );
  }
}
