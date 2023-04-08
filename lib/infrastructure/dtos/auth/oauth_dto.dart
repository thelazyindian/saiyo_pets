import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:saiyo_pets/domain/entities/oauth/oauth_token.dart';

part 'oauth_dto.g.dart';

@JsonSerializable()
class OauthDto extends Equatable {
  @JsonKey(name: 'access_token')
  final String? accessToken;
  @JsonKey(name: 'token_type')
  final String? tokenType;
  @JsonKey(name: 'expires_in')
  final int? expiresIn;

  const OauthDto({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  factory OauthDto.fromJson(Map<String, dynamic> json) {
    return _$OauthDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OauthDtoToJson(this);

  OauthToken toDomain() {
    return OauthToken(
      accessToken: accessToken!,
      tokenType: tokenType!,
      expiresIn: expiresIn!,
      createdAt: DateTime.now().toUtc(),
    );
  }

  @override
  List<Object?> get props => [
        accessToken,
        tokenType,
        expiresIn,
      ];
}
