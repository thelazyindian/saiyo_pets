import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'links.dart';

part 'type.g.dart';

@JsonSerializable()
class Type extends Equatable {
  final String? name;
  final List<String>? coats;
  final List<String>? colors;
  final List<String>? genders;
  @JsonKey(name: '_links')
  final Links? links;

  const Type({
    this.name,
    this.coats,
    this.colors,
    this.genders,
    this.links,
  });

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);

  @override
  List<Object?> get props => [name, coats, colors, genders, links];
}
