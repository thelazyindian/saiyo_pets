import 'package:equatable/equatable.dart';
import 'package:saiyo_pets/infrastructure/dtos/animals_response/adopter_dto.dart';

class Adopter extends Equatable {
  final int? id;
  final String? name;
  final String? adoptedAt;

  const Adopter({
    this.id,
    this.name,
    this.adoptedAt,
  });

  AdopterDto toDto() {
    return AdopterDto(
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
