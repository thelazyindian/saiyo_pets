import 'package:flutter/material.dart';
import 'package:saiyo_pets/presentation/common/views/app_empty_view.dart';

class LikedPage extends StatelessWidget {
  const LikedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Liked Pets',
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
      ),
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
