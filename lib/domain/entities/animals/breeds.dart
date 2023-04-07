import 'package:equatable/equatable.dart';

class Breeds extends Equatable {
  final String? primary;
  final String? secondary;
  final bool? mixed;
  final bool? unknown;

  const Breeds({this.primary, this.secondary, this.mixed, this.unknown});

  @override
  List<Object?> get props => [primary, secondary, mixed, unknown];
}
