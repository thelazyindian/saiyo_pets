// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeds.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedsDto _$BreedsDtoFromJson(Map<String, dynamic> json) => BreedsDto(
      primary: json['primary'] as String?,
      secondary: json['secondary'] as String?,
      mixed: json['mixed'] as bool?,
      unknown: json['unknown'] as bool?,
    );

Map<String, dynamic> _$BreedsDtoToJson(BreedsDto instance) => <String, dynamic>{
      'primary': instance.primary,
      'secondary': instance.secondary,
      'mixed': instance.mixed,
      'unknown': instance.unknown,
    };
