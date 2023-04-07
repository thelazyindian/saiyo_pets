import 'package:saiyo_pets/core/application/init/store.dart';
import 'package:flutter/material.dart';

Future<void> initialise() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialiseStore();
  // Initialize the app dependencies
}
