import 'package:saiyo_pets/core/error/exceptions.dart';
import 'package:saiyo_pets/core/error/failures.dart';
import 'package:saiyo_pets/core/network/network.dart';
import 'package:saiyo_pets/domain/repositories/i_animals_repository.dart';
import 'package:saiyo_pets/infrastructure/dtos/animals_response/animals_response.dart';

class AnimalsRepository implements IAnimalsRepository {
  AnimalsRepository(this.network);

  final INetwork network;

  @override
  Future<AnimalsResponse> getAnimals() async {
    try {
      return AnimalsResponse.fromJson({});
    } on NetworkException {
      throw NetworkFailure();
    } catch (e) {
      throw InternalFailure(e);
    }
  }
}
