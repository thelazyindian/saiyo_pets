import 'package:saiyo_pets/core/di/injectable.dart';
import 'package:saiyo_pets/core/store/db_store.dart';

Future<void> initialiseStore() async {
  // Initialize storage dependency
  await getIt<IDbStore>().init();
}
