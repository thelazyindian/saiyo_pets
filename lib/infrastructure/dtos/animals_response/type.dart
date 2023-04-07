import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'type.g.dart';

@JsonSerializable()
class Type extends Equatable {
  final String? href;

  const Type({this.href});

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);

  @override
  List<Object?> get props => [href];
}
