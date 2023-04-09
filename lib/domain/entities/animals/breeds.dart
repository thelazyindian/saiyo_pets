import 'package:equatable/equatable.dart';
import 'package:saiyo_pets/infrastructure/dtos/animals_response/breeds.dart';

class Breeds extends Equatable {
  final String? primary;
  final String? secondary;
  final bool? mixed;
  final bool? unknown;

  const Breeds({this.primary, this.secondary, this.mixed, this.unknown});

  BreedsDto toDto() {
    return BreedsDto(
      primary: primary,
      secondary: secondary,
      mixed: mixed,
      unknown: unknown,
    );
  }

  @override
  List<Object?> get props => [primary, secondary, mixed, unknown];
}
