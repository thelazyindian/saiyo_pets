import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'breeds.g.dart';

@JsonSerializable()
class Breeds extends Equatable {
  final String? primary;
  final dynamic secondary;
  final bool? mixed;
  final bool? unknown;

  const Breeds({this.primary, this.secondary, this.mixed, this.unknown});

  factory Breeds.fromJson(Map<String, dynamic> json) {
    return _$BreedsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BreedsToJson(this);

  @override
  List<Object?> get props => [primary, secondary, mixed, unknown];
}
