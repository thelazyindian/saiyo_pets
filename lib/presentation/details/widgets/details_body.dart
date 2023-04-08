import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:saiyo_pets/constants/dimens.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    super.key,
    required this.id,
    required this.mediumImage,
    required this.largeImage,
    required this.name,
    required this.description,
    required this.price,
    required this.contact,
    required this.addressLineOne,
    required this.addressLineTwo,
    required this.isMale,
    required this.ageInYears,
    required this.adoptButtonHeight,
  });

  final String id;
  final String mediumImage;
  final String largeImage;
  final String name;
  final String description;
  final String price;
  final String contact;
  final String addressLineOne;
  final String addressLineTwo;
  final bool isMale;
  final String ageInYears;
  final double adoptButtonHeight;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final imageHeight = MediaQuery.of(context).size.height * 0.62;

    final animalDetailsTopOffset = 48.0;

    final animalDetailsCardHeight = 120.0;

    return Stack(
      children: [
        Column(
          children: [
            Hero(
              tag: id,
              child: SizedBox(
                height: imageHeight,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: largeImage,
                  fadeInCurve: Curves.linear,
                  fadeInDuration: Duration.zero,
                  fadeOutCurve: Curves.linear,
                  fadeOutDuration: Duration.zero,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => CachedNetworkImage(
                    imageUrl: mediumImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: animalDetailsCardHeight - animalDetailsTopOffset,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _TagItem(
                          icon: Image.asset(
                            'assets/images/price-tag.png',
                            color: colorScheme.primary,
                          ),
                          label: 'PRICE',
                          description: price,
                        ),
                        _TagItem(
                          icon: Icon(
                            EvaIcons.phoneCall,
                            color: colorScheme.primary,
                            size: 32.0,
                          ),
                          label: 'CONTACT',
                          description: contact,
                        ),
                      ],
                    ),
                    Dimens.h16,
                    AnimationConfiguration.synchronized(
                      duration: const Duration(milliseconds: 475),
                      child: SlideAnimation(
                        horizontalOffset: 100.0,
                        child: FadeInAnimation(
                          child: Text(
                            description,
                            maxLines: 3,
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: colorScheme.onSecondary,
                                      fontSize: 19.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                        ),
                      ),
                    ),
                    Dimens.h32,
                    SizedBox(
                      height: adoptButtonHeight - kBottomNavigationBarHeight,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: imageHeight - animalDetailsTopOffset,
          left: 16.0,
          right: 16.0,
          child: SizedBox(
            height: animalDetailsCardHeight,
            child: _DetailsCard(
              name: name,
              isMale: isMale,
              ageInYears: ageInYears,
              addressLineOne: addressLineOne,
              addressLineTwo: addressLineTwo,
            ),
          ),
        ),
      ],
    );
  }
}

class _DetailsCard extends StatelessWidget {
  const _DetailsCard({
    super.key,
    required this.name,
    required this.isMale,
    required this.ageInYears,
    required this.addressLineOne,
    required this.addressLineTwo,
  });

  final String name;
  final bool isMale;
  final String ageInYears;
  final String addressLineOne;
  final String addressLineTwo;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AnimationConfiguration.synchronized(
      duration: const Duration(milliseconds: 475),
      child: SlideAnimation(
        verticalOffset: 300.0,
        child: FadeInAnimation(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: Dimens.brc24,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 8.0,
                  spreadRadius: 4.0,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 28.0,
                                color: colorScheme.onPrimaryContainer,
                                overflow: TextOverflow.ellipsis,
                              ),
                        ),
                      ),
                      Dimens.w8,
                      SizedBox(
                        height: 24.0,
                        width: 24.0,
                        child: Image.asset(isMale
                            ? 'assets/images/male-gender.png'
                            : 'assets/images/female-gender.png'),
                      ),
                    ],
                  ),
                  Dimens.h8,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              addressLineOne,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    overflow: TextOverflow.ellipsis,
                                  ),
                            ),
                            Dimens.h4,
                            Row(
                              children: [
                                Icon(
                                  EvaIcons.pinOutline,
                                  size: 18.0,
                                  color: colorScheme.onSecondary,
                                ),
                                Expanded(
                                  child: Text(
                                    addressLineTwo,
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: colorScheme.onSecondary,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            EvaIcons.clockOutline,
                            color: colorScheme.onSecondary,
                            size: 20.0,
                          ),
                          Dimens.w4,
                          Text(
                            ageInYears,
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: colorScheme.onSecondary,
                                  overflow: TextOverflow.ellipsis,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TagItem extends StatelessWidget {
  const _TagItem({
    super.key,
    required this.icon,
    required this.label,
    required this.description,
  });

  final Widget icon;
  final String label;
  final String description;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AnimationConfiguration.synchronized(
      duration: const Duration(milliseconds: 475),
      child: SlideAnimation(
        horizontalOffset: 100.0,
        child: FadeInAnimation(
          duration: const Duration(milliseconds: 475),
          child: Row(
            children: [
              SizedBox(
                height: 32.0,
                width: 32.0,
                child: icon,
              ),
              Dimens.w8,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    maxLines: 1,
                    style: textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSecondary,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    description,
                    maxLines: 1,
                    style: textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onPrimaryContainer,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
