import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:saiyo_pets/domain/entities/animals/attributes.dart';

part 'attributes.g.dart';

@JsonSerializable()
class AttributesDto extends Equatable {
  @JsonKey(name: 'spayed_neutered')
  final bool? spayedNeutered;
  @JsonKey(name: 'house_trained')
  final bool? houseTrained;
  final bool? declawed;
  @JsonKey(name: 'special_needs')
  final bool? specialNeeds;
  @JsonKey(name: 'shots_current')
  final bool? shotsCurrent;

  const AttributesDto({
    this.spayedNeutered,
    this.houseTrained,
    this.declawed,
    this.specialNeeds,
    this.shotsCurrent,
  });

  factory AttributesDto.fromJson(Map<String, dynamic> json) {
    return _$AttributesDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AttributesDtoToJson(this);

  Attributes toDomain() {
    return Attributes(
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
