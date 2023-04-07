import 'package:dartz/dartz.dart';
import 'package:saiyo_pets/core/error/failures.dart';
import 'package:saiyo_pets/infrastructure/dtos/animals_response/animals_response.dart';

abstract class IAnimalsRepository {
  Future<Either<IFailure, AnimalsResponse>> getAnimals({
    int? page,
    int? limit,
    String? name,
    String? type,
  });
}
