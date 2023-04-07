import 'package:flutter/material.dart';

class AppErrorView extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const AppErrorView({
    super.key,
    this.message = 'Something went wrong.',
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            message,
            style: TextStyle(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          const SizedBox(height: 8.0),
          TextButton(
            onPressed: onRetry,
            style: TextButton.styleFrom(
              primary: Theme.of(context).colorScheme.onPrimary,
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            child: Text('Retry'),
          ),
        ],
      ),
    );
  }
}
