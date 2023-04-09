import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:saiyo_pets/domain/entities/animals/adopter.dart';
import 'package:saiyo_pets/domain/entities/animals/animal.dart';
import 'package:saiyo_pets/infrastructure/dtos/animals_response/animal.dart';

part 'adopter_dto.g.dart';

@HiveType(typeId: 1)
class AdopterDto extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? adoptedAt;

  const AdopterDto({
    this.id,
    this.name,
    this.adoptedAt,
  });

  Adopter toDomain() {
    return Adopter(
      id: id,
      name: name,
      adoptedAt: adoptedAt,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      adoptedAt,
    ];
  }
}

@HiveType(typeId: 2)
class AdoptedAnimal extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final AdopterDto adopter;
  @HiveField(2)
  final String animal;

  AdoptedAnimal({
    required this.id,
    required this.adopter,
    required this.animal,
  });

  Animal toDomain() {
    return AnimalDto.fromJson(jsonDecode(animal)).toDomain().copyWith(
          adopter: adopter.toDomain(),
        );
  }

  @override
  List<Object?> get props {
    return [
      id,
      adopter,
      animal,
    ];
  }
}
