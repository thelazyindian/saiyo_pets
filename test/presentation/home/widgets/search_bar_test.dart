import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saiyo_pets/presentation/home/widgets/home_app_bar.dart';

void main() {
  testWidgets(
    'Search bar input field shows correct data',
    (tester) async {
      String searchValue = '';
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          appBar: HomeAppBar(
            controller: TextEditingController(),
            onSearch: (value) {
              searchValue = value;
            },
            onSearchCancel: () {
              searchValue = '';
            },
          ),
        ),
      ));

      final textFieldFinder = find.byType(TextField);
      expect(textFieldFinder, findsOneWidget);

      await tester.enterText(textFieldFinder, 'DummySearchSomePet');
      expect(searchValue, 'DummySearchSomePet');
      final textFinder = find.text('DummySearchSomePet');
      expect(textFinder, findsOneWidget);
    },
  );
}
