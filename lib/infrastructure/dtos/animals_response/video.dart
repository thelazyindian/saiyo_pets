import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:saiyo_pets/domain/entities/animals/video.dart';

part 'video.g.dart';

@JsonSerializable()
class VideoDto extends Equatable {
  final String? embed;

  const VideoDto({this.embed});

  factory VideoDto.fromJson(Map<String, dynamic> json) =>
      _$VideoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoDtoToJson(this);

  Video toDomain() {
    return Video(
      embed: embed,
    );
  }

  @override
  List<Object?> get props => [embed];
}
