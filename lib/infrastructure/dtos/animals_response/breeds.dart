import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:saiyo_pets/domain/entities/animals/breeds.dart';

part 'breeds.g.dart';

@JsonSerializable()
class BreedsDto extends Equatable {
  final String? primary;
  final String? secondary;
  final bool? mixed;
  final bool? unknown;

  const BreedsDto({this.primary, this.secondary, this.mixed, this.unknown});

  factory BreedsDto.fromJson(Map<String, dynamic> json) {
    return _$BreedsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BreedsDtoToJson(this);

  Breeds toDomain() {
    return Breeds(
      primary: primary,
      secondary: secondary,
      mixed: mixed,
      unknown: unknown,
    );
  }

  @override
  List<Object?> get props => [primary, secondary, mixed, unknown];
}
