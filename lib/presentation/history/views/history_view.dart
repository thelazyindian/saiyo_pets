import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timeline/flutter_timeline.dart';
import 'package:flutter_timeline/indicator_position.dart';
import 'package:saiyo_pets/constants/dimens.dart';
import 'package:saiyo_pets/core/di/injectable.dart';
import 'package:saiyo_pets/domain/entities/animals/animal.dart';
import 'package:saiyo_pets/presentation/common/views/app_empty_view.dart';
import 'package:saiyo_pets/presentation/common/views/app_error_view.dart';
import 'package:saiyo_pets/presentation/history/widgets/history_app_bar.dart';
import 'package:saiyo_pets/presentation/home/cubit/animals_cubit.dart';
import 'package:timeago/timeago.dart' as timeago;

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<AnimalsCubit, AnimalsState>(
      bloc: getIt<AnimalsCubit>(),
      builder: (context, state) {
        if (state.hasError) {
          return Center(
            child: AppErrorView(
              onRetry: () => getIt<AnimalsCubit>().refresh(),
            ),
          );
        }

        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.adoptedAnimals.isEmpty) {
          return const Center(child: AppEmptyView());
        }

        final groupAnimalsByTime = state.adoptedAnimals
            .fold<List<GroupAnimals>>([], (previousValue, element) {
          final timeAgo =
              timeago.format(DateTime.parse(element.adopter!.adoptedAt!));
          final idx =
              previousValue.indexWhere((element) => element.timeAgo == timeAgo);
          if (idx >= 0) {
            previousValue[idx].animals.add(element);
          } else {
            previousValue
                .add(GroupAnimals(timeAgo: timeAgo, animals: [element]));
          }
          return previousValue;
        });

        final List<TimelineEventDisplay> events = List.generate(
          groupAnimalsByTime.length,
          (index) => TimelineEventDisplay(
            anchor: IndicatorPosition.top,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Dimens.h12,
                Text(
                  groupAnimalsByTime[index].timeAgo,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: colorScheme.primary.withOpacity(0.35),
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Dimens.h16,
                ...List.generate(
                  groupAnimalsByTime[index].animals.length,
                  (animalIndex) => Column(
                    children: [
                      _AdoptedListItem(
                        image: groupAnimalsByTime[index]
                            .animals[animalIndex]
                            .getMediumImage,
                        name: groupAnimalsByTime[index]
                                .animals[animalIndex]
                                .name ??
                            'Unnamed',
                        age: groupAnimalsByTime[index]
                            .animals[animalIndex]
                            .ageInYears,
                        adopter: 'Adopter: ' +
                            (groupAnimalsByTime[index]
                                    .animals[animalIndex]
                                    .adopter
                                    ?.name ??
                                'Unnamed'),
                        enableDivider:
                            (groupAnimalsByTime[index].animals.length - 1 !=
                                animalIndex),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            indicator: Container(
              height: 30.0,
              width: 30.0,
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorScheme.background,
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.primary.withOpacity(0.2),
                    blurRadius: 4.0,
                    spreadRadius: 2.0,
                    offset: const Offset(0.0, 2.0),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/paws.png',
                color: colorScheme.primary,
              ),
            ),
          ),
        );

        return Scaffold(
          backgroundColor: colorScheme.background,
          appBar: const HistoryAppBar(),
          body: TimelineTheme(
            data: TimelineThemeData(
              gutterSpacing: 24.0,
              lineColor: colorScheme.outline,
              style: PaintingStyle.fill,
              strokeCap: StrokeCap.round,
              indicatorPosition: IndicatorPosition.top,
            ),
            child: Timeline(
              padding: const EdgeInsets.all(16.0),
              indicatorSize: 42.0,
              events: events,
            ),
          ),
        );
      },
    );
  }
}

class _AdoptedListItem extends StatelessWidget {
  const _AdoptedListItem({
    super.key,
    required this.image,
    required this.name,
    required this.age,
    required this.adopter,
    required this.enableDivider,
  });

  final String image;
  final String name;
  final String age;
  final String adopter;
  final bool enableDivider;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 80.0,
          width: 80.0,
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorScheme.background,
            boxShadow: [
              BoxShadow(
                color: colorScheme.primary.withOpacity(0.15),
                blurRadius: 6.0,
                spreadRadius: 3.0,
                offset: const Offset(0.0, 6.0),
              ),
            ],
          ),
          child: CachedNetworkImage(
            imageUrl: image,
            errorWidget: (context, url, error) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.outline,
                  shape: BoxShape.circle,
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
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        Dimens.w16,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Dimens.h8,
              Text(
                name,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Dimens.h8,
              Row(
                children: [
                  Icon(
                    EvaIcons.clockOutline,
                    color: colorScheme.onBackground,
                    size: 14.0,
                  ),
                  Dimens.w4,
                  Text(
                    age,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: colorScheme.onBackground,
                        ),
                  ),
                ],
              ),
              Dimens.h4,
              Text(
                adopter,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
              ),
              if (enableDivider)
                Container(
                  margin: const EdgeInsets.only(top: 20.0, bottom: 12.0),
                  height: 1.5,
                  width: double.infinity,
                  color: colorScheme.outline,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class GroupAnimals {
  final String timeAgo;
  final List<Animal> animals;

  GroupAnimals({
    required this.timeAgo,
    required this.animals,
  });
}
