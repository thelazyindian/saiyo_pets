import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:saiyo_pets/domain/entities/animals/animals_response.dart';

import 'animal.dart';
import 'pagination.dart';

part 'animals_response.g.dart';

@JsonSerializable()
class AnimalsResponseDto extends Equatable {
  final List<AnimalDto>? animals;
  final PaginationDto? pagination;

  const AnimalsResponseDto({this.animals, this.pagination});

  factory AnimalsResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AnimalsResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AnimalsResponseDtoToJson(this);

  AnimalsResponse toDomain() {
    return AnimalsResponse(
      animals: animals?.map((e) => e.toDomain()).toList(),
      currentPage: pagination?.currentPage,
      totalPages: pagination?.totalPages,
    );
  }

  @override
  List<Object?> get props => [animals, pagination];
}
