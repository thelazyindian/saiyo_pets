import 'package:dartz/dartz.dart';
import 'package:saiyo_pets/core/error/failures.dart';
import 'package:saiyo_pets/domain/entities/animals/animal.dart';
import 'package:saiyo_pets/domain/usecases/usecase.dart';

abstract class GetAdoptedAnimalsUseCase
    implements UseCase<List<Animal>, NoParams> {
  @override
  Future<Either<IFailure, List<Animal>>> call(NoParams params);
}
