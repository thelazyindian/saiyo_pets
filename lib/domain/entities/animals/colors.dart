import 'package:equatable/equatable.dart';

class Colors extends Equatable {
  final String? primary;
  final String? secondary;
  final String? tertiary;

  const Colors({this.primary, this.secondary, this.tertiary});

  @override
  List<Object?> get props => [primary, secondary, tertiary];
}
