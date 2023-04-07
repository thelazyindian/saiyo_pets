import 'package:saiyo_pets/core/application/app.dart';
import 'package:saiyo_pets/core/application/init/init.dart';
import 'package:flutter/material.dart';

void main() async {
  await initialise();
  runApp(const App());
}
