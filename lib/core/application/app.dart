import 'package:flutter/material.dart';
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
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.copyWith(
              headline6: const TextStyle(color: AppColors.onPrimary),
              subtitle1: const TextStyle(color: AppColors.primary),
            ),
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: AppColors.primary,
          onPrimary: AppColors.onPrimary,
          secondary: AppColors.secondary,
          onSecondary: AppColors.onSecondary,
          secondaryContainer: AppColors.secondaryContainer,
          error: AppColors.error,
          onError: AppColors.onError,
          background: AppColors.background,
          onBackground: AppColors.onBackground,
          surface: AppColors.background,
          onSurface: AppColors.onBackground,
        ),
      ),
      home: const BasePage(),
    );
  }
}
