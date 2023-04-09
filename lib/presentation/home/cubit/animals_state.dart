part of 'animals_cubit.dart';

class AnimalsState extends Equatable {
  const AnimalsState({
    this.isLoading = true,
    this.isLoadingMore = false,
    this.hasError = false,
    this.animals = const [],
    this.adoptedAnimals = const [],
    required this.adoptFailureOrSuccess,
  });

  final bool isLoading;
  final bool isLoadingMore;
  final bool hasError;
  final List<Animal> animals;
  final List<Animal> adoptedAnimals;
  final Option<Either<IFailure, Unit>> adoptFailureOrSuccess;

  factory AnimalsState.initial() => AnimalsState(adoptFailureOrSuccess: none());

  @override
  List<Object?> get props => [
        isLoading,
        isLoadingMore,
        hasError,
        animals,
        adoptedAnimals,
        adoptFailureOrSuccess,
      ];

  AnimalsState copyWith({
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasError,
    List<Animal>? animals,
    List<Animal>? adoptedAnimals,
    Option<Either<IFailure, Unit>>? adoptFailureOrSuccess,
  }) {
    return AnimalsState(
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasError: hasError ?? this.hasError,
      animals: animals ?? this.animals,
      adoptedAnimals: adoptedAnimals ?? this.adoptedAnimals,
      adoptFailureOrSuccess:
          adoptFailureOrSuccess ?? this.adoptFailureOrSuccess,
    );
  }
}
