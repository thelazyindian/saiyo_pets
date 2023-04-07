// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animals_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimalsResponse _$AnimalsResponseFromJson(Map<String, dynamic> json) =>
    AnimalsResponse(
      animals: (json['animals'] as List<dynamic>?)
          ?.map((e) => Animal.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimalsResponseToJson(AnimalsResponse instance) =>
    <String, dynamic>{
      'animals': instance.animals,
      'pagination': instance.pagination,
    };
