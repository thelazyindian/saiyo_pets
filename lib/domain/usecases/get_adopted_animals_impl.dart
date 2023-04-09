import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saiyo_pets/core/error/failures.dart';
import 'package:saiyo_pets/domain/entities/animals/animal.dart';
import 'package:saiyo_pets/domain/repositories/animals_repository.dart';
import 'package:saiyo_pets/domain/usecases/get_adopted_animals.dart';
import 'package:saiyo_pets/domain/usecases/usecase.dart';

@LazySingleton(as: GetAdoptedAnimalsUseCase)
class GetAdoptedAnimalsUseCaseImpl implements GetAdoptedAnimalsUseCase {
  final IAnimalsRepository animalsRepository;

  GetAdoptedAnimalsUseCaseImpl({required this.animalsRepository});

  @override
  Future<Either<IFailure, List<Animal>>> call(NoParams params) {
    return animalsRepository.getAdoptedAnimals();
  }
}
