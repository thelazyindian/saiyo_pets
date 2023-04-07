import 'package:saiyo_pets/core/application/init/store.dart';
import 'package:flutter/material.dart';
import 'package:saiyo_pets/core/di/injectable.dart';

Future<void> initialise() async {
  // Initialize the app dependencies
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  await initialiseStore();
}
