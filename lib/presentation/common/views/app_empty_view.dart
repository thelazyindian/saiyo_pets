import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:saiyo_pets/constants/dimens.dart';

class AppEmptyView extends StatelessWidget {
  final String message;

  const AppEmptyView({
    super.key,
    this.message = 'Nothing here.',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Icon(
            EvaIcons.slashOutline,
            size: 100.0,
          ),
          Dimens.h8,
          Text(
            message,
            style: TextStyle(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        ],
      ),
    );
  }
}
