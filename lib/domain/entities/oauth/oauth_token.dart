import 'package:hive_flutter/hive_flutter.dart';

part 'oauth_token.g.dart';

@HiveType(typeId: 0)
class OauthToken {
  @HiveField(0)
  final String accessToken;
  @HiveField(1)
  final String tokenType;
  @HiveField(2)
  final int expiresIn;
  @HiveField(3)
  final DateTime createdAt;

  OauthToken({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.createdAt,
  });

  bool get isExpired {
    final expiresAt = createdAt.add(Duration(seconds: expiresIn));
    return expiresAt.isBefore(DateTime.now());
  }
}
