// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OauthDto _$OauthDtoFromJson(Map<String, dynamic> json) => OauthDto(
      accessToken: json['accessToken'] as String?,
      tokenType: json['tokenType'] as String?,
      expiresIn: json['expiresIn'] as int?,
    );

Map<String, dynamic> _$OauthDtoToJson(OauthDto instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'tokenType': instance.tokenType,
      'expiresIn': instance.expiresIn,
    };
