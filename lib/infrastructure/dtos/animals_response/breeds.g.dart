// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeds.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Breeds _$BreedsFromJson(Map<String, dynamic> json) => Breeds(
      primary: json['primary'] as String?,
      secondary: json['secondary'],
      mixed: json['mixed'] as bool?,
      unknown: json['unknown'] as bool?,
    );

Map<String, dynamic> _$BreedsToJson(Breeds instance) => <String, dynamic>{
      'primary': instance.primary,
      'secondary': instance.secondary,
      'mixed': instance.mixed,
      'unknown': instance.unknown,
    };
