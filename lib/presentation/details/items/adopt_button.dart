import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:saiyo_pets/constants/dimens.dart';

class AdoptButton extends StatelessWidget {
  const AdoptButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AnimationConfiguration.synchronized(
      duration: const Duration(milliseconds: 475),
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: FadeInAnimation(
          duration: const Duration(milliseconds: 475),
          child: TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(
              foregroundColor: colorScheme.onPrimary,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Dimens.rc32,
                  topRight: Dimens.rc32,
                ),
              ),
              backgroundColor: colorScheme.primary,
              textStyle: Theme.of(context).textTheme.button!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 28.0,
                  width: 28.0,
                  child: Image.asset(
                    'assets/images/paws.png',
                    color: colorScheme.onPrimary,
                  ),
                ),
                Dimens.w16,
                const Text('Adopt Me'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
