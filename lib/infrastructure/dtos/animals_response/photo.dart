import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo extends Equatable {
  final String? small;
  final String? medium;
  final String? large;
  final String? full;

  const Photo({this.small, this.medium, this.large, this.full});

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);

  @override
  List<Object?> get props => [small, medium, large, full];
}
