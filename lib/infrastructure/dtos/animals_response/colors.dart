import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'colors.g.dart';

@JsonSerializable()
class Colors extends Equatable {
  final String? primary;
  final dynamic secondary;
  final dynamic tertiary;

  const Colors({this.primary, this.secondary, this.tertiary});

  factory Colors.fromJson(Map<String, dynamic> json) {
    return _$ColorsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ColorsToJson(this);

  @override
  List<Object?> get props => [primary, secondary, tertiary];
}
