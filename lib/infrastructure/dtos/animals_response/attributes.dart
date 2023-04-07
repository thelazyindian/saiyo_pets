import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attributes.g.dart';

@JsonSerializable()
class Attributes extends Equatable {
  @JsonKey(name: 'spayed_neutered')
  final bool? spayedNeutered;
  @JsonKey(name: 'house_trained')
  final bool? houseTrained;
  final bool? declawed;
  @JsonKey(name: 'special_needs')
  final bool? specialNeeds;
  @JsonKey(name: 'shots_current')
  final bool? shotsCurrent;

  const Attributes({
    this.spayedNeutered,
    this.houseTrained,
    this.declawed,
    this.specialNeeds,
    this.shotsCurrent,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return _$AttributesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AttributesToJson(this);

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
