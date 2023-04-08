// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttributesDto _$AttributesDtoFromJson(Map<String, dynamic> json) =>
    AttributesDto(
      spayedNeutered: json['spayed_neutered'] as bool?,
      houseTrained: json['house_trained'] as bool?,
      declawed: json['declawed'] as bool?,
      specialNeeds: json['special_needs'] as bool?,
      shotsCurrent: json['shots_current'] as bool?,
    );

Map<String, dynamic> _$AttributesDtoToJson(AttributesDto instance) =>
    <String, dynamic>{
      'spayed_neutered': instance.spayedNeutered,
      'house_trained': instance.houseTrained,
      'declawed': instance.declawed,
      'special_needs': instance.specialNeeds,
      'shots_current': instance.shotsCurrent,
    };
