import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  final String? small;
  final String? medium;
  final String? large;
  final String? full;

  const Photo({this.small, this.medium, this.large, this.full});

  @override
  List<Object?> get props => [small, medium, large, full];
}
