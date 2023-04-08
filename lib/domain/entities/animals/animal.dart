import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:saiyo_pets/domain/entities/animals/adopter.dart';

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
}
