import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'animal.dart';
import 'pagination.dart';

part 'animals_response.g.dart';

@JsonSerializable()
class AnimalsResponse extends Equatable {
  final List<Animal>? animals;
  final Pagination? pagination;

  const AnimalsResponse({this.animals, this.pagination});

  factory AnimalsResponse.fromJson(Map<String, dynamic> json) {
    return _$AnimalsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AnimalsResponseToJson(this);

  @override
  List<Object?> get props => [animals, pagination];
}
