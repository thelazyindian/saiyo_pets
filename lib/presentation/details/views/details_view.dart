import 'package:flutter/material.dart';
import 'package:saiyo_pets/domain/entities/animals/animal.dart';
import 'package:saiyo_pets/presentation/details/items/adopt_button.dart';
import 'package:saiyo_pets/presentation/details/widgets/details_app_bar.dart';
import 'package:saiyo_pets/presentation/details/widgets/details_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.animal});

  final Animal animal;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final adoptButtonHeight = 80.0;

    return Scaffold(
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
        price: '\$480',
        contact: animal.contact?.phone ?? '999-999-9999',
        addressLineOne: animal.contact?.address?.address1 ?? 'Unknown address',
        addressLineTwo: animal.cityStateAddress,
        isMale: animal.isMale,
        ageInYears: animal.ageInYears,
        adoptButtonHeight: adoptButtonHeight,
      ),
      bottomSheet: SizedBox(
        width: double.infinity,
        height: adoptButtonHeight,
        child: AdoptButton(
          onTap: () {},
        ),
      ),
    );
  }
}
