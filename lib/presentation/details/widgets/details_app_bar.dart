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

    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top + 8.0,
        bottom: 8.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimationConfiguration.synchronized(
            duration: const Duration(milliseconds: 475),
            child: SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(
                duration: const Duration(milliseconds: 475),
                child: Container(
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
          AnimationConfiguration.synchronized(
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
          )
        ],
      ),
    );
  }
}
