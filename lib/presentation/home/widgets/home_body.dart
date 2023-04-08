import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:saiyo_pets/core/di/injectable.dart';
import 'package:saiyo_pets/domain/entities/animals/animal.dart';
import 'package:saiyo_pets/presentation/common/views/app_empty_view.dart';
import 'package:saiyo_pets/presentation/common/views/app_error_view.dart';
import 'package:saiyo_pets/presentation/home/cubit/home_cubit.dart';
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
          onRetry: () => getIt<HomeCubit>().started(),
        ),
      );
    }

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (animals.isEmpty) {
      return const AppEmptyView();
    }

    return SingleChildScrollView(
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
            children: animals
                .map((e) => SizedBox(
                      height: 300.0,
                      child: AnimalCard(
                        image: e.getMediumImage,
                        isAdopted: e.isAdopted,
                        adoptStatus: e.adoptStatus,
                        name: e.name!,
                        breeds: e.breeds!.primary!,
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
