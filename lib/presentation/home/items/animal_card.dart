import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:saiyo_pets/constants/dimens.dart';

class AnimalCard extends StatelessWidget {
  const AnimalCard({
    super.key,
    required this.image,
    required this.isAdopted,
    required this.adoptStatus,
    required this.name,
    required this.breeds,
  });

  final String image;
  final bool isAdopted;
  final String adoptStatus;
  final String name;
  final String breeds;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          borderRadius: Dimens.brc16,
          side: BorderSide(
            width: 2.5,
            color: Theme.of(context).colorScheme.outline,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Dimens.rc16,
                      topRight: Dimens.rc16,
                    ),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        image,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 16.0,
                  right: 16.0,
                  child: Container(
                    height: 32.0,
                    width: 32.0,
                    decoration: BoxDecoration(
                      color: colorScheme.background,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      padding: const EdgeInsets.all(0.0),
                      iconSize: 18.0,
                      color: colorScheme.onSecondary,
                      icon: const Icon(EvaIcons.heart),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Dimens.h16,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 6.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: Dimens.brc24,
                    color: isAdopted
                        ? colorScheme.primary.withOpacity(0.25)
                        : colorScheme.tertiary,
                  ),
                  child: Text(
                    adoptStatus,
                    maxLines: 1,
                    style: TextStyle(
                      letterSpacing: 0.5,
                      fontSize: 10.5,
                      fontWeight: FontWeight.w500,
                      color: isAdopted
                          ? colorScheme.primary
                          : colorScheme.onTertiary,
                    ),
                  ),
                ),
                Dimens.h8,
                Text(
                  name,
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Dimens.h8,
                Text(
                  breeds,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: colorScheme.onBackground,
                      ),
                ),
              ],
            ),
          ),
          Dimens.h16,
        ],
      ),
    );
  }
}
