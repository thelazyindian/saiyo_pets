// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OauthDto _$OauthDtoFromJson(Map<String, dynamic> json) => OauthDto(
      accessToken: json['access_token'] as String?,
      tokenType: json['token_type'] as String?,
      expiresIn: json['expires_in'] as int?,
    );

Map<String, dynamic> _$OauthDtoToJson(OauthDto instance) => <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
    };
