import 'package:saiyo_pets/config/app/app_config.dart';
import 'package:saiyo_pets/core/network/network.dart';
import 'package:saiyo_pets/infrastructure/dtos/auth/oauth_dto.dart';

class RemoteDataSource {
  RemoteDataSource({
    required this.appConfig,
    required this.network,
  });

  final IAppConfig appConfig;

  final INetwork network;

  Future<OauthDto> getAccessToken() async {
    final authResponse = await network.post(
      baseUri: appConfig.animalApiUrl,
      path: '/oauth2/token',
      data: {
        'grant_type': 'client_credentials',
        'client_id': appConfig.apiKey,
        'client_secret': appConfig.apiSecret,
      },
    );
    return OauthDto.fromJson(authResponse.data);
  }
}
