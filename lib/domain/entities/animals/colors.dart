import 'package:equatable/equatable.dart';
import 'package:saiyo_pets/infrastructure/dtos/animals_response/colors.dart';

class Colors extends Equatable {
  final String? primary;
  final String? secondary;
  final String? tertiary;

  const Colors({this.primary, this.secondary, this.tertiary});

  ColorsDto toDto() {
    return ColorsDto(
      primary: primary,
      secondary: secondary,
      tertiary: tertiary,
    );
  }

  @override
  List<Object?> get props => [primary, secondary, tertiary];
}
