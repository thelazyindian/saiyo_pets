// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      self: json['self'] == null
          ? null
          : Self.fromJson(json['self'] as Map<String, dynamic>),
      type: json['type'] == null
          ? null
          : Type.fromJson(json['type'] as Map<String, dynamic>),
      organization: json['organization'] == null
          ? null
          : Organization.fromJson(json['organization'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'self': instance.self,
      'type': instance.type,
      'organization': instance.organization,
    };
