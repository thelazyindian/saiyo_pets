import 'package:saiyo_pets/core/error/failures.dart';
import 'package:saiyo_pets/infrastructure/dtos/animals_response/animals_response.dart';
import 'package:dartz/dartz.dart';

abstract class GetAnimals {
  Future<Either<IFailure, AnimalsResponse>> call();
}
