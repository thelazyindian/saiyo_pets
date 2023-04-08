import 'package:dartz/dartz.dart';
import 'package:saiyo_pets/core/error/failures.dart';
import 'package:saiyo_pets/domain/entities/animals/animals_response.dart';
import 'package:saiyo_pets/domain/usecases/usecase.dart';

abstract class GetAnimalsUseCase
    implements UseCase<AnimalsResponse, GetAnimalsParams> {
  @override
  Future<Either<IFailure, AnimalsResponse>> call(GetAnimalsParams params);
}

class GetAnimalsParams {
  final int? page;
  final int? limit;
  final String? name;
  final String? type;

  GetAnimalsParams({
    this.page,
    this.limit,
    this.name,
    this.type,
  });
}
