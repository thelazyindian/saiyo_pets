import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'type.dart';

part 'animal_types_response.g.dart';

@JsonSerializable()
class AnimalTypesResponse extends Equatable {
  final List<Type>? types;

  const AnimalTypesResponse({this.types});

  factory AnimalTypesResponse.fromJson(Map<String, dynamic> json) {
    return _$AnimalTypesResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AnimalTypesResponseToJson(this);

  @override
  List<Object?> get props => [types];
}
