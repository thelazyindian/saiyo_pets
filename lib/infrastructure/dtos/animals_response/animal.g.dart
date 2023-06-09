// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimalDto _$AnimalDtoFromJson(Map<String, dynamic> json) => AnimalDto(
      id: json['id'] as int?,
      organizationId: json['organization_id'] as String?,
      url: json['url'] as String?,
      type: json['type'] as String?,
      species: json['species'] as String?,
      breeds: json['breeds'] == null
          ? null
          : BreedsDto.fromJson(json['breeds'] as Map<String, dynamic>),
      colors: json['colors'] == null
          ? null
          : ColorsDto.fromJson(json['colors'] as Map<String, dynamic>),
      age: json['age'] as String?,
      gender: json['gender'] as String?,
      size: json['size'] as String?,
      coat: json['coat'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => PhotoDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => VideoDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      attributes: json['attributes'] == null
          ? null
          : AttributesDto.fromJson(json['attributes'] as Map<String, dynamic>),
      environment: json['environment'] == null
          ? null
          : EnvironmentDto.fromJson(
              json['environment'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      contact: json['contact'] == null
          ? null
          : ContactDto.fromJson(json['contact'] as Map<String, dynamic>),
      publishedAt: json['published_at'] as String?,
      distance: (json['distance'] as num?)?.toDouble(),
      links: json['_links'] == null
          ? null
          : Links.fromJson(json['_links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimalDtoToJson(AnimalDto instance) => <String, dynamic>{
      'id': instance.id,
      'organization_id': instance.organizationId,
      'url': instance.url,
      'type': instance.type,
      'species': instance.species,
      'breeds': instance.breeds,
      'colors': instance.colors,
      'age': instance.age,
      'gender': instance.gender,
      'size': instance.size,
      'coat': instance.coat,
      'name': instance.name,
      'description': instance.description,
      'photos': instance.photos,
      'videos': instance.videos,
      'status': instance.status,
      'attributes': instance.attributes,
      'environment': instance.environment,
      'tags': instance.tags,
      'contact': instance.contact,
      'published_at': instance.publishedAt,
      'distance': instance.distance,
      '_links': instance.links,
    };
