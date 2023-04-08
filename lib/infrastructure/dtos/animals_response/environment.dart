import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:saiyo_pets/domain/entities/animals/environment.dart';

part 'environment.g.dart';

@JsonSerializable()
class EnvironmentDto extends Equatable {
  final bool? children;
  final bool? dogs;
  final bool? cats;

  const EnvironmentDto({this.children, this.dogs, this.cats});

  factory EnvironmentDto.fromJson(Map<String, dynamic> json) {
    return _$EnvironmentDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EnvironmentDtoToJson(this);

  Environment toDomain() {
    return Environment(
      children: children,
      dogs: dogs,
      cats: cats,
    );
  }

  @override
  List<Object?> get props => [children, dogs, cats];
}
