part of 'nav_cubit.dart';

class NavState extends Equatable {
  const NavState({
    this.hideNavigationBar = false,
    required this.route,
  });

  final bool hideNavigationBar;
  final Option<Widget> route;

  factory NavState.initial() => NavState(route: none());

  @override
  List<Object?> get props => [
        hideNavigationBar,
        route,
      ];

  NavState copyWith({
    bool? hideNavigationBar,
    Option<Widget>? route,
  }) {
    return NavState(
      hideNavigationBar: hideNavigationBar ?? this.hideNavigationBar,
      route: route ?? this.route,
    );
  }
}
