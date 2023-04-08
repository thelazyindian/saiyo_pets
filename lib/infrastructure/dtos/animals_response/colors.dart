import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:saiyo_pets/domain/entities/animals/colors.dart';

part 'colors.g.dart';

@JsonSerializable()
class ColorsDto extends Equatable {
  final String? primary;
  final String? secondary;
  final String? tertiary;

  const ColorsDto({this.primary, this.secondary, this.tertiary});

  factory ColorsDto.fromJson(Map<String, dynamic> json) {
    return _$ColorsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ColorsDtoToJson(this);

  Colors toDomain() {
    return Colors(
      primary: primary,
      secondary: secondary,
      tertiary: tertiary,
    );
  }

  @override
  List<Object?> get props => [primary, secondary, tertiary];
}
