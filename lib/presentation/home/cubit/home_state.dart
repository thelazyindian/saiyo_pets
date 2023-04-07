part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.isLoading = true,
    this.isLoadingMore = false,
    this.hasError = false,
  });

  final bool isLoading;
  final bool isLoadingMore;
  final bool hasError;

  factory HomeState.initial() => const HomeState();

  @override
  List<Object> get props => [
        isLoading,
        isLoadingMore,
        hasError,
      ];

  HomeState copyWith({
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasError,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasError: hasError ?? this.hasError,
    );
  }
}
