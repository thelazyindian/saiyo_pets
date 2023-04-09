import 'package:flutter/material.dart';

class HistoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HistoryAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top + 8.0,
        bottom: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Text(
        'Past Adoptions',
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: colorScheme.onSecondary,
        ),
      ),
    );
  }
}
