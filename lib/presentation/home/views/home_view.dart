import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saiyo_pets/core/di/injectable.dart';
import 'package:saiyo_pets/presentation/home/cubit/animals_cubit.dart';
import 'package:saiyo_pets/presentation/home/widgets/home_app_bar.dart';
import 'package:saiyo_pets/presentation/home/widgets/home_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    getIt<AnimalsCubit>().started();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<AnimalsCubit, AnimalsState>(
      bloc: getIt<AnimalsCubit>(),
      builder: (context, state) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: colorScheme.background,
            systemNavigationBarColor: colorScheme.background,
          ),
          child: Scaffold(
            backgroundColor: colorScheme.background,
            appBar: HomeAppBar(
              controller: _searchController,
              onSearch: (value) {
                getIt<AnimalsCubit>().search(value);
              },
              onSearchCancel: () {
                getIt<AnimalsCubit>().cancelSearch();
              },
            ),
            body: HomeBody(
              hasMore: state.hasMore,
              hasError: state.hasError,
              isLoading: state.isLoading,
              animals: state.animals,
            ),
          ),
        );
      },
    );
  }
}
