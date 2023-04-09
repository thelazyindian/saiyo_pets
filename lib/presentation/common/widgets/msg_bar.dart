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
        backgroundColor: isError
            ? Colors.red.shade300
            : colorScheme.primary.withOpacity(0.4),
        content: Text(
          msg,
          style: Theme.of(this).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: isError ? Colors.white : colorScheme.primary,
              ),
        ),
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.all(16.0),
        shape: const RoundedRectangleBorder(
          borderRadius: Dimens.brc16,
        ),
      ),
    );
  }
}
