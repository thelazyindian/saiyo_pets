import 'package:flutter/material.dart';
import 'package:saiyo_pets/constants/dimens.dart';

extension MsgBar on BuildContext {
  void showMsgBar(
    String msg, {
    bool isError = false,
  }) {
    final colorScheme = Theme.of(this).colorScheme;

    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        elevation: 0,
        backgroundColor: Colors.white,
        content: Container(
          alignment: Alignment.center,
          height: 50.0,
          decoration: BoxDecoration(
            borderRadius: Dimens.brc8,
            color: isError
                ? Colors.red.shade300
                : colorScheme.primary.withOpacity(0.4),
          ),
          child: Text(
            msg,
            style: Theme.of(this).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: isError ? Colors.white : colorScheme.primary,
                ),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16.0),
        padding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: Dimens.brc8,
        ),
      ),
    );
  }
}
