import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:saiyo_pets/core/error/failures.dart';
import 'package:saiyo_pets/domain/entities/animals/adopter.dart';
import 'package:saiyo_pets/domain/entities/animals/animal.dart';
import 'package:saiyo_pets/domain/usecases/get_adopted_animals.dart';
import 'package:saiyo_pets/domain/usecases/get_animals.dart';
import 'package:saiyo_pets/domain/usecases/set_adopted_animals.dart';
import 'package:saiyo_pets/domain/usecases/usecase.dart';

part 'animals_state.dart';

@lazySingleton
class AnimalsCubit extends Cubit<AnimalsState> {
  AnimalsCubit({
    required this.getAnimals,
    required this.getAdoptedAnimals,
    required this.setAdoptedAnimals,
  }) : super(AnimalsState.initial());

  final GetAnimalsUseCase getAnimals;

  final GetAdoptedAnimalsUseCase getAdoptedAnimals;

  final SetAdoptedAnimalsUseCase setAdoptedAnimals;

  int currentPage = 1;

  Future<void> started() async {
    emit(state.copyWith(hasError: false, isLoading: true));
    await _fetchData();
  }

  Future<void> refresh() => _fetchData();

  Future<void> _fetchData() async {
    final animalsOption = await getAnimals(GetAnimalsParams(
      page: currentPage,
      limit: 50,
    ));

    final adoptedAnimalsOption = await getAdoptedAnimals(NoParams());

    animalsOption.fold(
      (error) => emit(state.copyWith(hasError: true)),
      (animalsResponse) {
        final animals = animalsResponse.animals ?? [];
        adoptedAnimalsOption.fold((error) {}, (adoptedAnimals) {
          for (final adopted in adoptedAnimals) {
            final index =
                animals.indexWhere((animal) => animal.id == adopted.id);
            if (index != -1) {
              animals[index] = adopted;
            } else {
              animals.insert(0, adopted);
            }
          }
        });

        emit(state.copyWith(
          hasError: false,
          animals: animalsResponse.animals,
        ));
      },
    );
    emit(state.copyWith(isLoading: false));
  }

  Future<void> adoptAnimal({required Animal animal}) async {
    if (!animal.isAdopted) {
      emit(state.copyWith(adoptFailureOrSuccess: none()));
      final adoptedAnimal = animal.copyWith(
        status: 'adopted',
        adopter: Adopter(
          id: 1,
          name: [
            'Daenerys Targaryen',
            'Jon Snow',
            'Arya Stark',
            'Sansa Stark'
          ][Random().nextInt(4)],
          adoptedAt: DateTime.now().toString(),
        ),
      );
      final result = await setAdoptedAnimals(SetAdoptedAnimalsParams(
        animal: adoptedAnimal,
      ));
      result.fold(
        (error) {
          emit(state.copyWith(adoptFailureOrSuccess: optionOf(left(error))));
        },
        (unit) {
          final List<Animal> animals = [...state.animals];
          final index =
              animals.indexWhere((element) => element.id == adoptedAnimal.id);
          animals[index] = adoptedAnimal;
          emit(state.copyWith(
            animals: animals,
            adoptedAnimals: [...state.adoptedAnimals, animal],
            adoptFailureOrSuccess: optionOf(right(unit)),
          ));
        },
      );
    }
  }
}
