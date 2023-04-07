import 'package:equatable/equatable.dart';

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
