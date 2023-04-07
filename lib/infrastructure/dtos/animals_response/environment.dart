import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'environment.g.dart';

@JsonSerializable()
class Environment extends Equatable {
  final bool? children;
  final bool? dogs;
  final bool? cats;

  const Environment({this.children, this.dogs, this.cats});

  factory Environment.fromJson(Map<String, dynamic> json) {
    return _$EnvironmentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EnvironmentToJson(this);

  @override
  List<Object?> get props => [children, dogs, cats];
}
