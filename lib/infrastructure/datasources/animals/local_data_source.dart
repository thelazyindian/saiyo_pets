import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:saiyo_pets/core/store/db_store.dart';
import 'package:saiyo_pets/infrastructure/dtos/animals_response/adopter_dto.dart';
import 'package:saiyo_pets/infrastructure/dtos/animals_response/animal.dart';

@lazySingleton
class LocalDataSource {
  LocalDataSource({required this.dbStore}) {
    dbStore.initStore(AdopterDtoAdapter());
    dbStore.initStore(AdoptedAnimalAdapter());
  }

  final IDbStore dbStore;

  final String animalStoreIdentifier = 'animals';

  final String adoptedAnimalStoreIdentifier = 'adopted_animals';

  Future<void> setAnimals({required List<AnimalDto> animals}) async {
    await Future.wait(
      animals
          .map((e) => dbStore.set<String>(
              storeIdentifier: animalStoreIdentifier,
              value: jsonEncode(e.toJson())))
          .toList(),
    );
  }

  Future<List<AnimalDto>> getAnimals() async {
    final data = await dbStore.getAll<String>(
      storeIdentifier: animalStoreIdentifier,
    );
    return data.map((e) => AnimalDto.fromJson(jsonDecode(e))).toList();
  }

  Future<void> setAdoptedAnimal({required AdoptedAnimal adoptedAnimal}) async {
    await dbStore.set<AdoptedAnimal>(
      storeIdentifier: adoptedAnimalStoreIdentifier,
      value: adoptedAnimal,
    );
  }

  Future<List<AdoptedAnimal>> getAdoptedAnimals() async {
    return dbStore.getAll<AdoptedAnimal>(
      storeIdentifier: adoptedAnimalStoreIdentifier,
    );
  }
}
