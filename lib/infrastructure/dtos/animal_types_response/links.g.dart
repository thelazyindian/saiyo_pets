// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      self: json['self'] == null
          ? null
          : Self.fromJson(json['self'] as Map<String, dynamic>),
      breeds: json['breeds'] == null
          ? null
          : Breeds.fromJson(json['breeds'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'self': instance.self,
      'breeds': instance.breeds,
    };
