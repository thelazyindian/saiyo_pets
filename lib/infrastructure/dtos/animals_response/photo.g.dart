// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
      small: json['small'] as String?,
      medium: json['medium'] as String?,
      large: json['large'] as String?,
      full: json['full'] as String?,
    );

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
      'full': instance.full,
    };
