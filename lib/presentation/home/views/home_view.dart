import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saiyo_pets/core/di/injectable.dart';
import 'package:saiyo_pets/presentation/home/cubit/home_cubit.dart';
import 'package:saiyo_pets/presentation/home/widgets/home_app_bar.dart';
import 'package:saiyo_pets/presentation/home/widgets/home_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    getIt<HomeCubit>().started();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<HomeCubit, HomeState>(
      bloc: getIt<HomeCubit>(),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: colorScheme.background,
          appBar: const HomeAppBar(),
          body: HomeBody(
            hasError: state.hasError,
            isLoading: state.isLoading,
            animals: state.animals,
          ),
        );
      },
    );
  }
}
