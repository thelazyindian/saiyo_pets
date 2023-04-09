import 'package:flutter/material.dart';
import 'package:saiyo_pets/constants/dimens.dart';

class AppEmptyView extends StatelessWidget {
  final String message;

  const AppEmptyView({
    super.key,
    this.message = 'No results found!',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100.0,
            width: 100.0,
            child: Image.asset(
              'assets/images/no-results.png',
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          Dimens.h16,
          Text(
            message,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
