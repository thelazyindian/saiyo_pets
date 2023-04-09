import 'package:flutter/material.dart';
import 'package:saiyo_pets/presentation/common/views/app_empty_view.dart';
import 'package:saiyo_pets/presentation/settings/widgets/settings_app_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const SettingsAppBar(),
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: colorScheme.background,
      body: const Center(
        child: AppEmptyView(
          message: 'Something\'s missing here.',
        ),
      ),
    );
  }
}
