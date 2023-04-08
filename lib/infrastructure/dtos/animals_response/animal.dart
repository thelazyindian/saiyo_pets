import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:saiyo_pets/domain/entities/animals/animal.dart';

import 'attributes.dart';
import 'breeds.dart';
import 'colors.dart';
import 'contact.dart';
import 'environment.dart';
import 'links.dart';
import 'photo.dart';
import 'video.dart';

part 'animal.g.dart';

@JsonSerializable()
class AnimalDto extends Equatable {
  final int? id;
  @JsonKey(name: 'organization_id')
  final String? organizationId;
  final String? url;
  final String? type;
  final String? species;
  final BreedsDto? breeds;
  final ColorsDto? colors;
  final String? age;
  final String? gender;
  final String? size;
  final String? coat;
  final String? name;
  final String? description;
  final List<PhotoDto>? photos;
  final List<VideoDto>? videos;
  final String? status;
  final AttributesDto? attributes;
  final EnvironmentDto? environment;
  final List<String>? tags;
  final ContactDto? contact;
  @JsonKey(name: 'published_at')
  final String? publishedAt;
  final double? distance;
  @JsonKey(name: '_links')
  final Links? links;

  const AnimalDto({
    this.id,
    this.organizationId,
    this.url,
    this.type,
    this.species,
    this.breeds,
    this.colors,
    this.age,
    this.gender,
    this.size,
    this.coat,
    this.name,
    this.description,
    this.photos,
    this.videos,
    this.status,
    this.attributes,
    this.environment,
    this.tags,
    this.contact,
    this.publishedAt,
    this.distance,
    this.links,
  });

  factory AnimalDto.fromJson(Map<String, dynamic> json) {
    return _$AnimalDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AnimalDtoToJson(this);

  Animal toDomain() {
    return Animal(
      id: id,
      url: url,
      type: type,
      species: species,
      breeds: breeds?.toDomain(),
      colors: colors?.toDomain(),
      age: age,
      gender: gender,
      size: size,
      coat: coat,
      name: name,
      description: description,
      photos: photos?.map((e) => e.toDomain()).toList(),
      videos: videos?.map((e) => e.toDomain()).toList(),
      status: status,
      attributes: attributes?.toDomain(),
      environment: environment?.toDomain(),
      tags: tags,
      contact: contact?.toDomain(),
      publishedAt: publishedAt,
      distance: distance,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      organizationId,
      url,
      type,
      species,
      breeds,
      colors,
      age,
      gender,
      size,
      coat,
      name,
      description,
      photos,
      videos,
      status,
      attributes,
      environment,
      tags,
      contact,
      publishedAt,
      distance,
      links,
    ];
  }
}
