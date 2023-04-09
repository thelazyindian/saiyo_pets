import 'package:equatable/equatable.dart';
import 'package:saiyo_pets/infrastructure/dtos/animals_response/attributes.dart';

class Attributes extends Equatable {
  final bool? spayedNeutered;
  final bool? houseTrained;
  final bool? declawed;
  final bool? specialNeeds;
  final bool? shotsCurrent;

  const Attributes({
    this.spayedNeutered,
    this.houseTrained,
    this.declawed,
    this.specialNeeds,
    this.shotsCurrent,
  });

  AttributesDto toDto() {
    return AttributesDto(
      spayedNeutered: spayedNeutered,
      houseTrained: houseTrained,
      declawed: declawed,
      specialNeeds: specialNeeds,
      shotsCurrent: shotsCurrent,
    );
  }

  @override
  List<Object?> get props {
    return [
      spayedNeutered,
      houseTrained,
      declawed,
      specialNeeds,
      shotsCurrent,
    ];
  }
}
