import 'package:dartz/dartz.dart';
import 'package:saiyo_pets/core/error/failures.dart';
import 'package:saiyo_pets/domain/entities/animals/animal.dart';
import 'package:saiyo_pets/domain/usecases/usecase.dart';

abstract class SetAdoptedAnimalsUseCase
    implements UseCase<Unit, SetAdoptedAnimalsParams> {
  @override
  Future<Either<IFailure, Unit>> call(SetAdoptedAnimalsParams params);
}

class SetAdoptedAnimalsParams {
  final Animal animal;

  SetAdoptedAnimalsParams({
    required this.animal,
  });
}
