import 'package:dartz/dartz.dart';
import 'package:saiyo_pets/core/error/failures.dart';
import 'package:saiyo_pets/domain/entities/oauth/oauth_token.dart';

abstract class IAuthRepository {
  Future<Either<IFailure, OauthToken>> getAccessToken();
}
