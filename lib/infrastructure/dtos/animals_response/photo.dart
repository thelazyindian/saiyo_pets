import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:saiyo_pets/domain/entities/animals/photo.dart';

part 'photo.g.dart';

@JsonSerializable()
class PhotoDto extends Equatable {
  final String? small;
  final String? medium;
  final String? large;
  final String? full;

  const PhotoDto({this.small, this.medium, this.large, this.full});

  factory PhotoDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoDtoToJson(this);

  Photo toDomain() {
    return Photo(
      small: small,
      medium: medium,
      large: large,
      full: full,
    );
  }

  @override
  List<Object?> get props => [small, medium, large, full];
}
