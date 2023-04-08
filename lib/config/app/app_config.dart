import 'package:injectable/injectable.dart';
import 'package:saiyo_pets/constants/env.dart';

abstract class IAppConfig {
  String get animalApiUrl;

  String get apiKey;

  String get apiSecret;
}

@LazySingleton(as: IAppConfig)
class AppConfig implements IAppConfig {
  @override
  final String animalApiUrl;
  @override
  final String apiKey;
  @override
  final String apiSecret;

  AppConfig({
    required this.animalApiUrl,
    required this.apiKey,
    required this.apiSecret,
  });

  @factoryMethod
  factory AppConfig.main() => AppConfig(
        animalApiUrl: 'https://api.petfinder.com/v2',
        apiKey: API_KEY,
        apiSecret: API_SECRET,
      );
}
