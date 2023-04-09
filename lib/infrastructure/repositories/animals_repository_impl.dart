import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saiyo_pets/core/error/exceptions.dart';
import 'package:saiyo_pets/core/error/failures.dart';
import 'package:saiyo_pets/domain/entities/animals/animal.dart';
import 'package:saiyo_pets/domain/entities/animals/animals_response.dart';
import 'package:saiyo_pets/domain/repositories/animals_repository.dart';
import 'package:saiyo_pets/infrastructure/datasources/animals/local_data_source.dart';
import 'package:saiyo_pets/infrastructure/datasources/animals/remote_data_source.dart';
import 'package:saiyo_pets/infrastructure/dtos/animals_response/adopter_dto.dart';

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
    return _parseAnimalsResponse(() async {
      final animalsResDto = await remoteDataSource.getAnimals(
        page: page,
        limit: limit,
        name: name,
        type: type,
        accessToken: accessToken,
      );

      final animalsWithPhotos = animalsResDto.animals!
          .where((element) => element.photos?.isNotEmpty ?? false)
          .toList();
      localDataSource.setAnimals(animals: animalsWithPhotos);

      final animalsWithPhotosDomain =
          animalsWithPhotos.map((e) => e.toDomain()).toList();
      return animalsResDto
          .toDomain()
          .copyWith(animals: animalsWithPhotosDomain);
    });
  }

  Future<Either<IFailure, AnimalsResponse>> _parseAnimalsResponse(
      Future<AnimalsResponse> Function() response) async {
    try {
      return right(await response());
    } on NetworkException catch (e) {
      return left(NetworkFailure(e.message));
    } catch (e, t) {
      return left(InternalFailure(e, t));
    }
  }

  @override
  Future<Either<IFailure, Unit>> setAdoptedAnimal({
    required Animal animal,
  }) async {
    try {
      await localDataSource.setAdoptedAnimal(
          adoptedAnimal: AdoptedAnimal(
        id: animal.id!,
        adopter: animal.adopter!.toDto(),
        animal: jsonEncode(animal.toDto().toJson()),
      ));
      return right(unit);
    } catch (e, t) {
      return left(InternalFailure(e, t));
    }
  }

  @override
  Future<Either<IFailure, List<Animal>>> getAdoptedAnimals() async {
    try {
      final data = await localDataSource.getAdoptedAnimals();
      return right(data.map((e) => e.toDomain()).toList());
    } catch (e, t) {
      return left(InternalFailure(e, t));
    }
  }
}
