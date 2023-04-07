import 'package:equatable/equatable.dart';

class Video extends Equatable {
  final String? embed;

  const Video({this.embed});

  @override
  List<Object?> get props => [embed];
}
