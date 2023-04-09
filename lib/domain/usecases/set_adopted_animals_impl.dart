import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saiyo_pets/core/error/failures.dart';
import 'package:saiyo_pets/domain/repositories/animals_repository.dart';
import 'package:saiyo_pets/domain/usecases/set_adopted_animals.dart';

@LazySingleton(as: SetAdoptedAnimalsUseCase)
class SetAdoptedAnimalsUseCaseImpl implements SetAdoptedAnimalsUseCase {
  final IAnimalsRepository animalsRepository;

  SetAdoptedAnimalsUseCaseImpl({required this.animalsRepository});

  @override
  Future<Either<IFailure, Unit>> call(SetAdoptedAnimalsParams params) {
    return animalsRepository.setAdoptedAnimal(animal: params.animal);
  }
}
