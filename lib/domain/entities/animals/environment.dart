import 'package:equatable/equatable.dart';

class Environment extends Equatable {
  final bool? children;
  final bool? dogs;
  final bool? cats;

  const Environment({this.children, this.dogs, this.cats});

  @override
  List<Object?> get props => [children, dogs, cats];
}
