import 'package:injectable/injectable.dart';
import 'package:saiyo_pets/core/network/network.dart';
import 'package:saiyo_pets/infrastructure/dtos/animals_response/animals_response.dart';

@lazySingleton
class RemoteDataSource {
  final INetwork network;

  RemoteDataSource({required this.network});

  final String baseUri = 'https://api.petfinder.com/v2';

  Future<AnimalsResponseDto> getAnimals({
    int? page,
    int? limit,
    String? name,
    String? type,
  }) async {
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
    return AnimalsResponseDto.fromJson(response.data);
  }
}
