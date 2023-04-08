import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saiyo_pets/domain/entities/animals/animal.dart';
import 'package:saiyo_pets/presentation/details/items/adopt_button.dart';
import 'package:saiyo_pets/presentation/details/popups/adopted_popup.dart';
import 'package:saiyo_pets/presentation/details/widgets/details_app_bar.dart';
import 'package:saiyo_pets/presentation/details/widgets/details_body.dart';

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

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: colorScheme.background,
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
          id: widget.animal.id!.toString(),
          mediumImage: widget.animal.getMediumImage,
          largeImage: widget.animal.getLargeImage,
          name: widget.animal.name ?? 'Unknown',
          description: widget.animal.description ?? 'No description',
          price: '\$480',
          contact: widget.animal.contact?.phone ?? '999-999-9999',
          addressLineOne:
              widget.animal.contact?.address?.address1 ?? 'Unknown address',
          addressLineTwo: widget.animal.cityStateAddress,
          isMale: widget.animal.isMale,
          ageInYears: widget.animal.ageInYears,
          adoptButtonHeight: adoptButtonHeight,
        ),
        bottomSheet: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            systemNavigationBarColor: colorScheme.primary,
          ),
          child: SizedBox(
            width: double.infinity,
            height: adoptButtonHeight,
            child: AdoptButton(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return const AdoptedPopup();
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
