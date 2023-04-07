import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'breeds.dart';
import 'self.dart';

part 'links.g.dart';

@JsonSerializable()
class Links extends Equatable {
  final Self? self;
  final Breeds? breeds;

  const Links({this.self, this.breeds});

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);

  @override
  List<Object?> get props => [self, breeds];
}
