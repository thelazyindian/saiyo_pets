import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:saiyo_pets/presentation/common/widgets/favourite_icon.dart';

class DetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailsAppBar({super.key, required this.onFavouriteTap});

  final VoidCallback onFavouriteTap;

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: AnimationConfiguration.synchronized(
        duration: const Duration(milliseconds: 475),
        child: SlideAnimation(
          horizontalOffset: 50.0,
          child: FadeInAnimation(
            duration: const Duration(milliseconds: 475),
            child: Container(
              margin: const EdgeInsets.only(left: 8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorScheme.background,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(EvaIcons.arrowBackOutline),
                color: colorScheme.onSecondary,
              ),
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: AnimationConfiguration.synchronized(
            duration: const Duration(milliseconds: 475),
            child: SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(
                duration: const Duration(milliseconds: 475),
                child: FavouriteIcon(
                  onTap: onFavouriteTap,
                  iconSize: 24.0,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
