import 'package:equatable/equatable.dart';
import 'package:saiyo_pets/infrastructure/dtos/animals_response/photo.dart';

class Photo extends Equatable {
  final String? small;
  final String? medium;
  final String? large;
  final String? full;

  const Photo({this.small, this.medium, this.large, this.full});

  PhotoDto toDto() {
    return PhotoDto(
      small: small,
      medium: medium,
      large: large,
      full: full,
    );
  }

  @override
  List<Object?> get props => [small, medium, large, full];
}
