// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_types_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimalTypesResponse _$AnimalTypesResponseFromJson(Map<String, dynamic> json) =>
    AnimalTypesResponse(
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => Type.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnimalTypesResponseToJson(
        AnimalTypesResponse instance) =>
    <String, dynamic>{
      'types': instance.types,
    };
