import 'package:dartz/dartz.dart';
import 'package:saiyo_pets/core/error/failures.dart';
import 'package:saiyo_pets/domain/entities/animals/animal.dart';
import 'package:saiyo_pets/domain/entities/animals/animals_response.dart';

abstract class IAnimalsRepository {
  Future<Either<IFailure, AnimalsResponse>> getAnimals({
    int? page,
    int? limit,
    String? name,
    String? type,
    required String accessToken,
  });

  Future<Either<IFailure, Unit>> setAdoptedAnimal({
    required Animal animal,
  });

  Future<Either<IFailure, List<Animal>>> getAdoptedAnimals();
}
