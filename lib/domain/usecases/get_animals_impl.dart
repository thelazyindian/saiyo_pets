import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saiyo_pets/core/error/failures.dart';
import 'package:saiyo_pets/domain/entities/animals/animals_response.dart';
import 'package:saiyo_pets/domain/repositories/animals_repository.dart';
import 'package:saiyo_pets/domain/repositories/auth_repository.dart';
import 'package:saiyo_pets/domain/usecases/get_animals.dart';

@LazySingleton(as: GetAnimalsUseCase)
class GetAnimalsUseCaseImpl implements GetAnimalsUseCase {
  GetAnimalsUseCaseImpl({
    required this.animalsRepository,
    required this.authRepository,
  });

  final IAnimalsRepository animalsRepository;

  final IAuthRepository authRepository;

  @override
  Future<Either<IFailure, AnimalsResponse>> call(
      GetAnimalsParams params) async {
    final accessTokenOption = await authRepository.getAccessToken();
    return accessTokenOption.fold(
      (error) => left(error),
      (oauthToken) => animalsRepository.getAnimals(
        accessToken: oauthToken.accessToken,
      ),
    );
  }
}
