import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'nav_state.dart';

@lazySingleton
class NavCubit extends Cubit<NavState> {
  NavCubit() : super(NavState.initial());

  void showNavigationBar() {
    emit(state.copyWith(hideNavigationBar: false));
  }

  void hideNavigationBar() {
    emit(state.copyWith(hideNavigationBar: true));
  }

  void setRoute(Widget route) {
    emit(state.copyWith(route: some(route)));
    emit(state.copyWith(route: none()));
  }
}
