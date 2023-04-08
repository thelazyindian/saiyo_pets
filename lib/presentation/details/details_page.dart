import 'package:flutter/material.dart';
import 'package:saiyo_pets/domain/entities/animals/animal.dart';
import 'package:saiyo_pets/presentation/details/views/details_view.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.animal});

  final Animal animal;

  @override
  Widget build(BuildContext context) {
    return DetailsView(animal: animal);
  }
}
