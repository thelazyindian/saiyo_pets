import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:saiyo_pets/core/di/injectable.dart';
import 'package:saiyo_pets/domain/entities/animals/animal.dart';
import 'package:saiyo_pets/presentation/common/views/app_empty_view.dart';
import 'package:saiyo_pets/presentation/common/views/app_error_view.dart';
import 'package:saiyo_pets/presentation/details/details_page.dart';
import 'package:saiyo_pets/presentation/home/cubit/animals_cubit.dart';
import 'package:saiyo_pets/presentation/home/items/animal_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.hasError,
    required this.isLoading,
    required this.animals,
  });

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
      return const AppEmptyView();
    }

    return AnimationLimiter(
      child: RefreshIndicator(
        onRefresh: () => getIt<AnimalsCubit>().refresh(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Row(
              //   children: [
              //     Text(
              //       'Newest Pets',
              //       style:
              //           Theme.of(context).textTheme.titleMedium,
              //     ),
              //   ],
              // ),
              // Dimens.h16,
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsPage(animal: animals[index]),
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
            ],
          ),
        ),
      ),
    );
  }
}
