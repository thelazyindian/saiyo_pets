import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

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
class Animal extends Equatable {
  final int? id;
  @JsonKey(name: 'organization_id')
  final String? organizationId;
  final String? url;
  final String? type;
  final String? species;
  final Breeds? breeds;
  final Colors? colors;
  final String? age;
  final String? gender;
  final String? size;
  final String? coat;
  final String? name;
  final String? description;
  final List<Photo>? photos;
  final List<Video>? videos;
  final String? status;
  final Attributes? attributes;
  final Environment? environment;
  final List<String>? tags;
  final Contact? contact;
  @JsonKey(name: 'published_at')
  final String? publishedAt;
  final double? distance;
  @JsonKey(name: '_links')
  final Links? links;

  const Animal({
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

  factory Animal.fromJson(Map<String, dynamic> json) {
    return _$AnimalFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AnimalToJson(this);

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
