import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({
    super.key,
    required this.iconSize,
    required this.onTap,
  });

  final double iconSize;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.background,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onTap,
        padding: const EdgeInsets.all(0.0),
        iconSize: iconSize,
        color: colorScheme.onSecondary,
        icon: const Icon(EvaIcons.heart),
      ),
    );
  }
}
