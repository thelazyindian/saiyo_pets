import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'organization.dart';
import 'self.dart';
import 'type.dart';

part 'links.g.dart';

@JsonSerializable()
class Links extends Equatable {
  final Self? self;
  final Type? type;
  final Organization? organization;

  const Links({this.self, this.type, this.organization});

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);

  @override
  List<Object?> get props => [self, type, organization];
}
