import 'package:dartz/dartz.dart';
import 'package:saiyo_pets/core/error/exceptions.dart';
import 'package:saiyo_pets/core/error/failures.dart';
import 'package:saiyo_pets/domain/entities/oauth/oauth_token.dart';
import 'package:saiyo_pets/domain/repositories/auth_repository.dart';
import 'package:saiyo_pets/infrastructure/datasources/auth/local_data_source.dart';
import 'package:saiyo_pets/infrastructure/datasources/auth/remote_data_source.dart';

class AuthRepositoryImpl implements IAuthRepository {
  AuthRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  final LocalDataSource localDataSource;

  final RemoteDataSource remoteDataSource;

  @override
  Future<Either<IFailure, OauthToken>> getAccessToken() async {
    return _parseResponse(() async {
      final localAccessTokenRes = await localDataSource.getAuthToken();
      if (localAccessTokenRes != null && !localAccessTokenRes.isExpired) {
        return localAccessTokenRes;
      } else {
        final accessTokenRes = await remoteDataSource.getAccessToken();
        final accessToken = accessTokenRes.toDomain();
        localDataSource.setAuthToken(oauthToken: accessToken);
        return accessToken;
      }
    });
  }

  Future<Either<IFailure, OauthToken>> _parseResponse(
      Future<OauthToken> Function() response) async {
    try {
      return right(await response());
    } on NetworkException {
      return left(NetworkFailure());
    } catch (e) {
      return left(InternalFailure(e));
    }
  }
}
