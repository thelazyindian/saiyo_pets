import 'package:saiyo_pets/infrastructure/dtos/animals_response/animals_response.dart';

abstract class IAnimalsRepository {
  Future<AnimalsResponse> getAnimals();
}
