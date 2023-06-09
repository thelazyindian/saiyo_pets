import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:saiyo_pets/constants/dimens.dart';
import 'package:saiyo_pets/presentation/common/widgets/favourite_icon.dart';

class AnimalCard extends StatelessWidget {
  const AnimalCard({
    super.key,
    required this.id,
    required this.image,
    required this.isAdopted,
    required this.adoptStatus,
    required this.name,
    required this.breeds,
    required this.onTap,
  });

  final String id;
  final String image;
  final bool isAdopted;
  final String adoptStatus;
  final String name;
  final String breeds;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: Dimens.brc16,
          side: BorderSide(
            width: 2.5,
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AnimalImage(id: id, image: image),
            ),
            Dimens.h16,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AnimalDetails(
                isAdopted: isAdopted,
                adoptStatus: adoptStatus,
                name: name,
                breeds: breeds,
              ),
            ),
            Dimens.h16,
          ],
        ),
      ),
    );
  }
}

class AnimalImage extends StatelessWidget {
  const AnimalImage({
    super.key,
    required this.id,
    required this.image,
  });

  final String id;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: id,
          child: CachedNetworkImage(
            imageUrl: image,
            errorWidget: (context, url, error) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.outline,
                  borderRadius: const BorderRadius.only(
                    topLeft: Dimens.rc16,
                    topRight: Dimens.rc16,
                  ),
                ),
                child: Icon(
                  EvaIcons.videoOffOutline,
                  color:
                      Theme.of(context).colorScheme.primary.withOpacity(0.35),
                  size: 60.0,
                ),
              );
            },
            imageBuilder: (context, imageProvider) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.outline,
                  borderRadius: const BorderRadius.only(
                    topLeft: Dimens.rc16,
                    topRight: Dimens.rc16,
                  ),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          top: 16.0,
          right: 16.0,
          child: SizedBox(
            height: 32.0,
            width: 32.0,
            child: FavouriteIcon(
              onTap: () {},
              iconSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }
}

class AnimalDetails extends StatelessWidget {
  const AnimalDetails({
    super.key,
    required this.isAdopted,
    required this.adoptStatus,
    required this.name,
    required this.breeds,
  });

  final bool isAdopted;
  final String adoptStatus;
  final String name;
  final String breeds;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: Dimens.brc24,
            color: Colors.white,
          ),
          child: Container(
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
                color: isAdopted ? colorScheme.primary : colorScheme.onTertiary,
              ),
            ),
          ),
        ),
        Dimens.h8,
        Text(
          name,
          maxLines: 1,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onPrimaryContainer,
              ),
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
    );
  }
}
