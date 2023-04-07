import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:saiyo_pets/domain/usecases/get_animals.dart';

part 'home_state.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.getAnimals}) : super(HomeState.initial());

  final GetAnimalsUseCase getAnimals;

  void started() {}
}
