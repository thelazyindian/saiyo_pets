// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animals_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimalsResponseDto _$AnimalsResponseDtoFromJson(Map<String, dynamic> json) =>
    AnimalsResponseDto(
      animals: (json['animals'] as List<dynamic>?)
          ?.map((e) => AnimalDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : PaginationDto.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimalsResponseDtoToJson(AnimalsResponseDto instance) =>
    <String, dynamic>{
      'animals': instance.animals,
      'pagination': instance.pagination,
    };
