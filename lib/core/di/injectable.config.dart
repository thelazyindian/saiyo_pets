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

import '../../domain/repositories/animals_repository.dart' as _i7;
import '../../domain/usecases/get_animals.dart' as _i9;
import '../../domain/usecases/get_animals_impl.dart' as _i10;
import '../../infrastructure/datasources/local_data_source.dart' as _i5;
import '../../infrastructure/datasources/remote_data_source.dart' as _i6;
import '../../infrastructure/repositories/animals_repository_impl.dart' as _i8;
import '../../presentation/home/cubit/home_cubit.dart' as _i11;
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
    gh.lazySingleton<_i5.LocalDataSource>(() => _i5.LocalDataSource());
    gh.lazySingleton<_i6.RemoteDataSource>(
        () => _i6.RemoteDataSource(network: gh<_i3.INetwork>()));
    gh.lazySingleton<_i7.IAnimalsRepository>(() => _i8.AnimalsRepository(
          localDataSource: gh<_i5.LocalDataSource>(),
          remoteDataSource: gh<_i6.RemoteDataSource>(),
        ));
    gh.lazySingleton<_i9.GetAnimalsUseCase>(() =>
        _i10.GetAnimalsUseCaseImpl(repository: gh<_i7.IAnimalsRepository>()));
    gh.lazySingleton<_i11.HomeCubit>(
        () => _i11.HomeCubit(getAnimals: gh<_i9.GetAnimalsUseCase>()));
    return this;
  }
}
