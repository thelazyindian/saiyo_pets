import 'package:flutter/material.dart';
import 'package:saiyo_pets/presentation/common/views/app_empty_view.dart';
import 'package:saiyo_pets/presentation/liked/widgets/liked_app_bar.dart';

class LikedPage extends StatelessWidget {
  const LikedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const LikedAppBar(),
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: colorScheme.background,
      body: const Center(
          child: AppEmptyView(
        message: 'You\'ve no liked pets.',
      )),
    );
  }
}
