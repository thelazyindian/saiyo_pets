import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'organization.g.dart';

@JsonSerializable()
class Organization extends Equatable {
  final String? href;

  const Organization({this.href});

  factory Organization.fromJson(Map<String, dynamic> json) {
    return _$OrganizationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrganizationToJson(this);

  @override
  List<Object?> get props => [href];
}
