// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:saiyo_pets/domain/entities/animals/animal.dart';
import 'package:saiyo_pets/domain/entities/animals/animals_response.dart';
import 'package:saiyo_pets/domain/entities/oauth/oauth_token.dart';
import 'package:saiyo_pets/domain/repositories/animals_repository.dart';
import 'package:saiyo_pets/domain/repositories/auth_repository.dart';
import 'package:saiyo_pets/domain/usecases/get_animals.dart';
import 'package:saiyo_pets/domain/usecases/get_animals_impl.dart';

import 'get_animals_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<IAnimalsRepository>(),
  MockSpec<IAuthRepository>(),
])
void main() {
  late GetAnimalsUseCase usecase;
  late IAnimalsRepository animalsRepository;
  late IAuthRepository authRepository;

  setUp(() {
    animalsRepository = MockIAnimalsRepository();
    authRepository = MockIAuthRepository();
    usecase = GetAnimalsUseCaseImpl(
      animalsRepository: animalsRepository,
      authRepository: authRepository,
    );
  });

  final oauthToken = OauthToken(
    accessToken: 'accessToken',
    tokenType: 'tokenType',
    expiresIn: 3600,
    createdAt: DateTime.now(),
  );

  final params = GetAnimalsParams(page: 1);
  final animalsResponse = AnimalsResponse(
    animals: [
      Animal(
        id: 1,
        name: 'name',
        type: 'type',
        description: 'description',
      )
    ],
    currentPage: 1,
  );

  test(
    'get animals from repository',
    () async {
      when(authRepository.getAccessToken())
          .thenAnswer((_) async => Right(oauthToken));
      when(animalsRepository.getAnimals(
        page: params.page,
        accessToken: oauthToken.accessToken,
      )).thenAnswer((_) async => Right(animalsResponse));

      final result = await usecase(params);

      expect(result, Right(animalsResponse));
      verify(animalsRepository.getAnimals(
        page: params.page,
        accessToken: oauthToken.accessToken,
      ));
      verifyNoMoreInteractions(animalsRepository);
    },
  );
}
