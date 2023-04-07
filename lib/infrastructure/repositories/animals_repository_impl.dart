import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saiyo_pets/core/error/exceptions.dart';
import 'package:saiyo_pets/core/error/failures.dart';
import 'package:saiyo_pets/core/network/network.dart';
import 'package:saiyo_pets/domain/repositories/animals_repository.dart';
import 'package:saiyo_pets/infrastructure/dtos/animals_response/animals_response.dart';

@LazySingleton(as: IAnimalsRepository)
class AnimalsRepository implements IAnimalsRepository {
  AnimalsRepository({required this.network});

  final INetwork network;

  final String baseUri = 'https://api.petfinder.com/v2';

  @override
  Future<Either<IFailure, AnimalsResponse>> getAnimals({
    int? page,
    int? limit,
    String? name,
    String? type,
  }) async {
    return _parseResponse(() async {
      final response = await network.get(
        baseUri: baseUri,
        path: '/animals',
        query: {
          if (page != null) 'page': page,
          if (limit != null) 'limit': limit,
          if (name != null) 'name': name,
          if (type != null) 'type': type,
        },
      );
      return AnimalsResponse.fromJson(response.data);
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
