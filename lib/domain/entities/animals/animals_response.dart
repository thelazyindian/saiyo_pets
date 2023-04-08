import 'package:equatable/equatable.dart';

import 'animal.dart';

class AnimalsResponse extends Equatable {
  final List<Animal>? animals;
  final int? currentPage;
  final int? totalPages;

  const AnimalsResponse({
    this.animals,
    this.currentPage,
    this.totalPages,
  });

  @override
  List<Object?> get props => [animals, currentPage, totalPages];

  AnimalsResponse copyWith({
    List<Animal>? animals,
    int? currentPage,
    int? totalPages,
  }) {
    return AnimalsResponse(
      animals: animals ?? this.animals,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
    );
  }
}
