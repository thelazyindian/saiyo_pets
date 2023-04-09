import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:saiyo_pets/constants/dimens.dart';
import 'package:saiyo_pets/core/di/injectable.dart';
import 'package:saiyo_pets/domain/entities/animals/animal.dart';
import 'package:saiyo_pets/presentation/common/views/app_empty_view.dart';
import 'package:saiyo_pets/presentation/common/views/app_error_view.dart';
import 'package:saiyo_pets/presentation/details/details_page.dart';
import 'package:saiyo_pets/presentation/home/cubit/animals_cubit.dart';
import 'package:saiyo_pets/presentation/home/cubit/nav_cubit.dart';
import 'package:saiyo_pets/presentation/home/items/animal_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.hasMore,
    required this.hasError,
    required this.isLoading,
    required this.animals,
  });

  final bool hasMore;
  final bool hasError;
  final bool isLoading;
  final List<Animal> animals;

  @override
  Widget build(BuildContext context) {
    if (hasError) {
      return Center(
        child: AppErrorView(
          onRetry: () => getIt<AnimalsCubit>().refresh(),
        ),
      );
    }

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (animals.isEmpty) {
      return const Center(child: AppEmptyView());
    }

    return AnimationLimiter(
      child: NotificationListener<ScrollEndNotification>(
        onNotification: (notification) {
          if (notification.metrics.pixels ==
              notification.metrics.maxScrollExtent) {
            getIt<AnimalsCubit>().loadMore();
          }
          return true;
        },
        child: RefreshIndicator(
          onRefresh: () => getIt<AnimalsCubit>().refresh(),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ResponsiveGridList(
                        horizontalGridSpacing: 16,
                        verticalGridSpacing: 16,
                        // horizontalGridMargin: 50,
                        // verticalGridMargin: 50,
                        minItemWidth: 200,
                        minItemsPerRow: 2,
                        maxItemsPerRow: 5,
                        listViewBuilderOptions: ListViewBuilderOptions(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                        ),
                        children: List.generate(
                          animals.length,
                          (index) => AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: SizedBox(
                                  height: 300.0,
                                  child: AnimalCard(
                                    id: animals[index].id!.toString(),
                                    image: animals[index].getMediumImage,
                                    isAdopted: animals[index].isAdopted,
                                    adoptStatus: animals[index].adoptStatus,
                                    name: animals[index].name!,
                                    breeds: animals[index].breeds!.primary!,
                                    onTap: () {
                                      getIt<NavCubit>().setRoute(
                                        DetailsPage(
                                          animal: animals[index],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (hasMore)
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 100.0,
                          child: Center(
                            child: ClipRRect(
                              borderRadius: Dimens.brc48,
                              child: LinearProgressIndicator(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.4),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
