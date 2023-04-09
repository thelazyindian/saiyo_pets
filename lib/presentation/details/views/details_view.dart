import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saiyo_pets/core/di/injectable.dart';
import 'package:saiyo_pets/domain/entities/animals/animal.dart';
import 'package:saiyo_pets/presentation/common/widgets/msg_bar.dart';
import 'package:saiyo_pets/presentation/details/items/adopt_button.dart';
import 'package:saiyo_pets/presentation/details/popups/adopted_popup.dart';
import 'package:saiyo_pets/presentation/details/widgets/details_app_bar.dart';
import 'package:saiyo_pets/presentation/details/widgets/details_body.dart';
import 'package:saiyo_pets/presentation/details/widgets/interactive_media_viewer.dart';
import 'package:saiyo_pets/presentation/home/cubit/animals_cubit.dart';
import 'package:saiyo_pets/presentation/home/cubit/nav_cubit.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({
    super.key,
    required this.animal,
  });

  final Animal animal;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final adoptButtonHeight = 80.0;

    return BlocConsumer<AnimalsCubit, AnimalsState>(
      bloc: getIt<AnimalsCubit>(),
      listenWhen: (previous, current) =>
          previous.adoptFailureOrSuccess != current.adoptFailureOrSuccess,
      listener: (context, state) {
        state.adoptFailureOrSuccess.fold(
          () => null,
          (fOrS) => fOrS.fold(
            (error) => context.showMsgBar(error.message),
            (name) => showDialog(
              context: context,
              builder: (_) {
                return AdoptedPopup(name: name);
              },
            ),
          ),
        );
      },
      builder: (context, state) {
        final animal =
            state.animals.where((e) => e.id == widget.animal.id).first;

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: colorScheme.primary,
          ),
          child: Scaffold(
            appBar: DetailsAppBar(
              onFavouriteTap: () {},
            ),
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: colorScheme.background,
            body: DetailsBody(
              id: animal.id!.toString(),
              mediumImage: animal.getMediumImage,
              largeImage: animal.getLargeImage,
              name: animal.name ?? 'Unknown',
              description: animal.description ?? 'No description',
              price: '\$${animal.price!}',
              contact: animal.contact?.phone ?? '999-999-9999',
              addressLineOne:
                  animal.contact?.address?.address1 ?? 'Unknown address',
              addressLineTwo: animal.cityStateAddress,
              isMale: animal.isMale,
              ageInYears: animal.ageInYears,
              adoptButtonHeight: adoptButtonHeight,
              onImageTap: () {
                getIt<NavCubit>().setRoute(
                  InteractiveMediaViewer(
                    id: animal.id!.toString(),
                    image: animal.getLargeImage,
                  ),
                );
              },
            ),
            bottomSheet: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle(
                systemNavigationBarColor: animal.isAdopted
                    ? colorScheme.secondary
                    : colorScheme.primary,
              ),
              child: Container(
                width: double.infinity,
                height: adoptButtonHeight,
                color: colorScheme.background,
                child: AdoptButton(
                  onTap: () {
                    getIt<AnimalsCubit>().adoptAnimal(animal: animal);
                  },
                  isAdopted: animal.isAdopted,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
