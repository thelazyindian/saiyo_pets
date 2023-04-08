import 'package:injectable/injectable.dart';
import 'package:saiyo_pets/domain/entities/animals/animal.dart';

@lazySingleton
class LocalDataSource {
  LocalDataSource();

  Future<void> setAnimals({required List<Animal> animals}) async {}

  Future<List<Animal>?> getAnimals() async {}
}
