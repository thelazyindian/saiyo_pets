import 'package:equatable/equatable.dart';
import 'package:saiyo_pets/infrastructure/dtos/animals_response/environment.dart';

class Environment extends Equatable {
  final bool? children;
  final bool? dogs;
  final bool? cats;

  const Environment({this.children, this.dogs, this.cats});

  EnvironmentDto toDto() {
    return EnvironmentDto(
      children: children,
      dogs: dogs,
      cats: cats,
    );
  }

  @override
  List<Object?> get props => [children, dogs, cats];
}
