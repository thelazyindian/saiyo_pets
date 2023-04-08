import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saiyo_pets/core/error/exceptions.dart';
import 'package:saiyo_pets/core/error/failures.dart';
import 'package:saiyo_pets/domain/entities/animals/animals_response.dart';
import 'package:saiyo_pets/domain/repositories/animals_repository.dart';
import 'package:saiyo_pets/infrastructure/datasources/animals/local_data_source.dart';
import 'package:saiyo_pets/infrastructure/datasources/animals/remote_data_source.dart';

@LazySingleton(as: IAnimalsRepository)
class AnimalsRepository implements IAnimalsRepository {
  AnimalsRepository({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  final LocalDataSource localDataSource;

  final RemoteDataSource remoteDataSource;

  @override
  Future<Either<IFailure, AnimalsResponse>> getAnimals({
    int? page,
    int? limit,
    String? name,
    String? type,
    required String accessToken,
  }) async {
    return _parseResponse(() async {
      final animalsResDto = await remoteDataSource.getAnimals(
        page: page,
        limit: limit,
        name: name,
        type: type,
        accessToken: accessToken,
      );
      return animalsResDto.toDomain();
    });
  }

  Future<Either<IFailure, AnimalsResponse>> _parseResponse(
      Future<AnimalsResponse> Function() response) async {
    try {
      return right(await response());
    } on NetworkException {
      return left(NetworkFailure());
    } catch (e) {
      return left(InternalFailure(e));
    }
  }
}
