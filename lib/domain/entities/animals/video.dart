import 'package:equatable/equatable.dart';
import 'package:saiyo_pets/infrastructure/dtos/animals_response/video.dart';

class Video extends Equatable {
  final String? embed;

  const Video({this.embed});

  VideoDto toDto() {
    return VideoDto(
      embed: embed,
    );
  }

  @override
  List<Object?> get props => [embed];
}
