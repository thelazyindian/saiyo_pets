import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:saiyo_pets/config/theme/theme_config.dart';
import 'package:saiyo_pets/constants/app_strings.dart';
import 'package:saiyo_pets/presentation/base.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeConfig.getLightTheme(context),
      dark: ThemeConfig.getDarkTheme(context),
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        darkTheme: darkTheme,
        theme: theme,
        home: const BasePage(),
      ),
    );
  }
}
