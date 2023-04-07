import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable()
class Video extends Equatable {
  final String? embed;

  const Video({this.embed});

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);

  @override
  List<Object?> get props => [embed];
}
