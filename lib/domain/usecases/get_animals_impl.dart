import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saiyo_pets/core/error/failures.dart';
import 'package:saiyo_pets/domain/entities/animals/animals_response.dart';
import 'package:saiyo_pets/domain/repositories/animals_repository.dart';
import 'package:saiyo_pets/domain/usecases/get_animals.dart';

@LazySingleton(as: GetAnimalsUseCase)
class GetAnimalsUseCaseImpl implements GetAnimalsUseCase {
  final IAnimalsRepository repository;

  GetAnimalsUseCaseImpl({required this.repository});

  @override
  Future<Either<IFailure, AnimalsResponse>> call(
      GetAnimalsParams params) async {
    return repository.getAnimals();
  }
}
