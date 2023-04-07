import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'breeds.g.dart';

@JsonSerializable()
class Breeds extends Equatable {
  final String? href;

  const Breeds({this.href});

  factory Breeds.fromJson(Map<String, dynamic> json) {
    return _$BreedsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BreedsToJson(this);

  @override
  List<Object?> get props => [href];
}
