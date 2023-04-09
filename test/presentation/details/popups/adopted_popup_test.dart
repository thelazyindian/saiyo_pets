import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saiyo_pets/presentation/home/items/animal_card.dart';

void main() {
  testWidgets(
    'Animal Card shows correct data and image',
    (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: AnimalCard(
            id: 'id',
            image: 'https://dummyimage.com/600x400/000/fff',
            isAdopted: true,
            adoptStatus: 'Adopted',
            name: 'SomePet',
            breeds: 'SomeBreed',
            onTap: () {},
          ),
        ),
      ));

      final nameFinder = find.text('SomePet');
      final breedFinder = find.text('SomeBreed');
      final adoptStatusFinder = find.text('Adopted');
      final imageFinder = find.byType(CachedNetworkImage);

      expect(nameFinder, findsOneWidget);
      expect(breedFinder, findsOneWidget);
      expect(imageFinder, findsOneWidget);
      expect(adoptStatusFinder, findsOneWidget);
    },
  );
}
