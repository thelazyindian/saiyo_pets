// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnvironmentDto _$EnvironmentDtoFromJson(Map<String, dynamic> json) =>
    EnvironmentDto(
      children: json['children'] as bool?,
      dogs: json['dogs'] as bool?,
      cats: json['cats'] as bool?,
    );

Map<String, dynamic> _$EnvironmentDtoToJson(EnvironmentDto instance) =>
    <String, dynamic>{
      'children': instance.children,
      'dogs': instance.dogs,
      'cats': instance.cats,
    };
