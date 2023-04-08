import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:saiyo_pets/constants/dimens.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppBar(
      backgroundColor: colorScheme.background,
      elevation: 0,
      title: Row(
        children: [
          Expanded(
            child: _SearchBar(),
          ),
          Dimens.w8,
          _SearchPreferencesButton(),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: Dimens.brc48,
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Row(
        children: [
          Dimens.w16,
          Icon(
            EvaIcons.searchOutline,
            color: colorScheme.onSecondary,
          ),
          Dimens.w8,
          Expanded(
            child: TextField(
              cursorColor: colorScheme.primary,
              style: TextStyle(
                color: colorScheme.onSecondary,
              ),
              decoration: InputDecoration(
                  hintText: 'Find your lovely pet',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: colorScheme.onSecondary,
                  )),
            ),
          ),
          Dimens.w16,
        ],
      ),
    );
  }
}

class _SearchPreferencesButton extends StatelessWidget {
  const _SearchPreferencesButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return IconButton(
      onPressed: () {},
      icon: const Icon(
        EvaIcons.options2Outline,
      ),
      color: colorScheme.onSecondary,
    );
  }
}
