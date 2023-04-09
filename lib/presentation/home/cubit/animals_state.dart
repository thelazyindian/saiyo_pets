part of 'animals_cubit.dart';

class AnimalsState extends Equatable {
  const AnimalsState({
    this.isLoading = true,
    this.isLoadingMore = false,
    this.hasError = false,
    this.hasMore = true,
    this.animals = const [],
    this.adoptedAnimals = const [],
    required this.adoptFailureOrSuccess,
  });

  final bool isLoading;
  final bool isLoadingMore;
  final bool hasError;
  final bool hasMore;
  final List<Animal> animals;
  final List<Animal> adoptedAnimals;
  final Option<Either<IFailure, String>> adoptFailureOrSuccess;

  factory AnimalsState.initial() => AnimalsState(adoptFailureOrSuccess: none());

  @override
  List<Object?> get props => [
        isLoading,
        isLoadingMore,
        hasError,
        hasMore,
        animals,
        adoptedAnimals,
        adoptFailureOrSuccess,
      ];

  AnimalsState copyWith({
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasError,
    bool? hasMore,
    List<Animal>? animals,
    List<Animal>? adoptedAnimals,
    Option<Either<IFailure, String>>? adoptFailureOrSuccess,
  }) {
    return AnimalsState(
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasError: hasError ?? this.hasError,
      hasMore: hasMore ?? this.hasMore,
      animals: animals ?? this.animals,
      adoptedAnimals: adoptedAnimals ?? this.adoptedAnimals,
      adoptFailureOrSuccess:
          adoptFailureOrSuccess ?? this.adoptFailureOrSuccess,
    );
  }
}
