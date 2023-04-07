// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../domain/repositories/animals_repository.dart' as _i5;
import '../../domain/usecases/get_animals.dart' as _i7;
import '../../domain/usecases/get_animals_impl.dart' as _i8;
import '../../infrastructure/repositories/animals_repository_impl.dart' as _i6;
import '../../presentation/home/cubit/home_cubit.dart' as _i9;
import '../network/network.dart' as _i3;
import '../network/network_impl.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.INetwork>(() => _i4.NetworkImpl());
    gh.lazySingleton<_i5.IAnimalsRepository>(
        () => _i6.AnimalsRepository(network: gh<_i3.INetwork>()));
    gh.lazySingleton<_i7.GetAnimalsUseCase>(() =>
        _i8.GetAnimalsUseCaseImpl(repository: gh<_i5.IAnimalsRepository>()));
    gh.lazySingleton<_i9.HomeCubit>(
        () => _i9.HomeCubit(getAnimals: gh<_i7.GetAnimalsUseCase>()));
    return this;
  }
}
