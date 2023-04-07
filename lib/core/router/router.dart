import 'package:saiyo_pets/core/router/interface/route.dart';
import 'package:flutter/material.dart';

extension Router on BuildContext {
  Future<T?> pushRoute<T extends Object?>(AppRoute route) {
    return Navigator.of(this).push<T>(MaterialPageRoute(
      builder: (_) => route,
      settings: RouteSettings(name: route.routeName),
    ));
  }

  Future<T?> pushNamedRoute<T extends Object?>(String route) {
    return Navigator.of(this).pushNamed<T>(route);
  }

  Future<T?> replaceRoute<T extends Object?, TO extends Object?>(
    AppRoute route, {
    TO? result,
  }) {
    return Navigator.of(this).pushReplacement<T, TO>(
      MaterialPageRoute(
        builder: (_) => route,
        settings: RouteSettings(name: route.routeName),
      ),
      result: result,
    );
  }

  Future<T?> pushAndPopUntilRoot<T extends Object?>(AppRoute route) {
    return Navigator.of(this).pushAndRemoveUntil<T>(
      MaterialPageRoute(
        builder: (_) => route,
        settings: RouteSettings(name: route.routeName),
      ),
      (_) => false,
    );
  }

  void popUntilRoute<T extends Object?>(AppRoute route) {
    return Navigator.of(this).popUntil(ModalRoute.withName(route.routeName));
  }

  void popRoute<T extends Object?>([T? result]) {
    return Navigator.pop<T>(this, result);
  }
}
