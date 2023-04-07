// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Environment _$EnvironmentFromJson(Map<String, dynamic> json) => Environment(
      children: json['children'] as bool?,
      dogs: json['dogs'] as bool?,
      cats: json['cats'] as bool?,
    );

Map<String, dynamic> _$EnvironmentToJson(Environment instance) =>
    <String, dynamic>{
      'children': instance.children,
      'dogs': instance.dogs,
      'cats': instance.cats,
    };
