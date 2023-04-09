import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:saiyo_pets/domain/entities/animals/adopter.dart';
import 'package:saiyo_pets/infrastructure/dtos/animals_response/animal.dart';

import 'attributes.dart';
import 'breeds.dart';
import 'colors.dart';
import 'contact.dart';
import 'environment.dart';
import 'photo.dart';
import 'video.dart';

class Animal extends Equatable {
  final int? id;
  final String? url;
  final String? type;
  final String? species;
  final Breeds? breeds;
  final Colors? colors;
  final String? age;
  final String? price;
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
  final String? publishedAt;
  final double? distance;
  final Adopter? adopter;

  const Animal({
    this.id,
    this.url,
    this.type,
    this.species,
    this.breeds,
    this.colors,
    this.age,
    this.price,
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
    this.adopter,
  });

  bool get isMale => gender == 'Male';

  bool get isAdopted => adopter != null || status == 'adopted';

  bool get hasMediumImage =>
      photos?.any((photo) => photo.medium != null) ?? false;

  String get getMediumImage => photos?.firstOrNull?.medium ?? '';

  String get getLargeImage => photos?.firstOrNull?.large ?? '';

  String get adoptStatus => status == 'adoptable' ? 'Adoptable' : 'Adopted';

  String get cityStateAddress =>
      (contact?.address?.city != null ? '${contact?.address?.city!}, ' : '') +
      (contact?.address?.state != null ? '${contact?.address?.state!}, ' : '') +
      (contact?.address?.country ?? 'Unknown');

  String get ageInYears {
    switch (age) {
      case 'Baby':
        return '0-1 years';
      case 'Young':
        return '1-3 years';
      case 'Adult':
        return '3-8 years';
      case 'Senior':
        return '8+ years';
      default:
        return 'Unknown';
    }
  }

  AnimalDto toDto() {
    return AnimalDto(
      id: id,
      url: url,
      type: type,
      species: species,
      breeds: breeds?.toDto(),
      colors: colors?.toDto(),
      age: age,
      gender: gender,
      size: size,
      coat: coat,
      name: name,
      description: description,
      photos: photos?.map((photo) => photo.toDto()).toList(),
      videos: videos?.map((video) => video.toDto()).toList(),
      status: status,
      attributes: attributes?.toDto(),
      environment: environment?.toDto(),
      tags: tags,
      contact: contact?.toDto(),
      publishedAt: publishedAt,
      distance: distance,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      url,
      type,
      species,
      breeds,
      colors,
      age,
      price,
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
      adopter,
    ];
  }

  Animal copyWith({
    int? id,
    String? url,
    String? type,
    String? species,
    Breeds? breeds,
    Colors? colors,
    String? age,
    String? price,
    String? gender,
    String? size,
    String? coat,
    String? name,
    String? description,
    List<Photo>? photos,
    List<Video>? videos,
    String? status,
    Attributes? attributes,
    Environment? environment,
    List<String>? tags,
    Contact? contact,
    String? publishedAt,
    double? distance,
    Adopter? adopter,
  }) {
    return Animal(
      id: id ?? this.id,
      url: url ?? this.url,
      type: type ?? this.type,
      species: species ?? this.species,
      breeds: breeds ?? this.breeds,
      colors: colors ?? this.colors,
      age: age ?? this.age,
      price: price ?? this.price,
      gender: gender ?? this.gender,
      size: size ?? this.size,
      coat: coat ?? this.coat,
      name: name ?? this.name,
      description: description ?? this.description,
      photos: photos ?? this.photos,
      videos: videos ?? this.videos,
      status: status ?? this.status,
      attributes: attributes ?? this.attributes,
      environment: environment ?? this.environment,
      tags: tags ?? this.tags,
      contact: contact ?? this.contact,
      publishedAt: publishedAt ?? this.publishedAt,
      distance: distance ?? this.distance,
      adopter: adopter ?? this.adopter,
    );
  }
}
