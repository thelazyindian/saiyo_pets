import 'package:flutter/material.dart';

class BaseProviders extends StatefulWidget {
  final Widget child;

  const BaseProviders({super.key, required this.child});

  @override
  State<BaseProviders> createState() => _BaseProvidersState();
}

class _BaseProvidersState extends State<BaseProviders> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
