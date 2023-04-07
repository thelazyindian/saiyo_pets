// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      name: json['name'] as String?,
      coats:
          (json['coats'] as List<dynamic>?)?.map((e) => e as String).toList(),
      colors:
          (json['colors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      genders:
          (json['genders'] as List<dynamic>?)?.map((e) => e as String).toList(),
      links: json['_links'] == null
          ? null
          : Links.fromJson(json['_links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'name': instance.name,
      'coats': instance.coats,
      'colors': instance.colors,
      'genders': instance.genders,
      '_links': instance.links,
    };
