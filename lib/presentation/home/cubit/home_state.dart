part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.isLoading = true,
    this.isLoadingMore = false,
    this.hasError = false,
    this.animals = const [],
  });

  final bool isLoading;
  final bool isLoadingMore;
  final bool hasError;
  final List<Animal> animals;

  factory HomeState.initial() => const HomeState();

  @override
  List<Object> get props => [
        isLoading,
        isLoadingMore,
        hasError,
        animals,
      ];

  HomeState copyWith({
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasError,
    List<Animal>? animals,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasError: hasError ?? this.hasError,
      animals: animals ?? this.animals,
    );
  }
}
