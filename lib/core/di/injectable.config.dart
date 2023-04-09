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

import '../../config/app/app_config.dart' as _i3;
import '../../domain/repositories/animals_repository.dart' as _i12;
import '../../domain/repositories/auth_repository.dart' as _i14;
import '../../domain/usecases/get_adopted_animals.dart' as _i18;
import '../../domain/usecases/get_adopted_animals_impl.dart' as _i19;
import '../../domain/usecases/get_animals.dart' as _i20;
import '../../domain/usecases/get_animals_impl.dart' as _i21;
import '../../domain/usecases/set_adopted_animals.dart' as _i16;
import '../../domain/usecases/set_adopted_animals_impl.dart' as _i17;
import '../../infrastructure/datasources/animals/local_data_source.dart' as _i8;
import '../../infrastructure/datasources/animals/remote_data_source.dart'
    as _i11;
import '../../infrastructure/datasources/auth/local_data_source.dart' as _i7;
import '../../infrastructure/datasources/auth/remote_data_source.dart' as _i10;
import '../../infrastructure/repositories/animals_repository_impl.dart' as _i13;
import '../../infrastructure/repositories/auth_repository_impl.dart' as _i15;
import '../../presentation/home/cubit/animals_cubit.dart' as _i22;
import '../../presentation/home/cubit/nav_cubit.dart' as _i9;
import '../network/network.dart' as _i5;
import '../network/network_impl.dart' as _i6;
import '../store/db_store.dart' as _i4;

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
    gh.lazySingleton<_i3.IAppConfig>(() => _i3.AppConfig.main());
    gh.lazySingleton<_i4.IDbStore>(() => _i4.DbStore());
    gh.lazySingleton<_i5.INetwork>(() => _i6.NetworkImpl());
    gh.lazySingleton<_i7.LocalDataSource>(
        () => _i7.LocalDataSource(dbStore: gh<_i4.IDbStore>()));
    gh.lazySingleton<_i8.LocalDataSource>(
        () => _i8.LocalDataSource(dbStore: gh<_i4.IDbStore>()));
    gh.lazySingleton<_i9.NavCubit>(() => _i9.NavCubit());
    gh.lazySingleton<_i10.RemoteDataSource>(() => _i10.RemoteDataSource(
          appConfig: gh<_i3.IAppConfig>(),
          network: gh<_i5.INetwork>(),
        ));
    gh.lazySingleton<_i11.RemoteDataSource>(
        () => _i11.RemoteDataSource(network: gh<_i5.INetwork>()));
    gh.lazySingleton<_i12.IAnimalsRepository>(() => _i13.AnimalsRepository(
          localDataSource: gh<_i8.LocalDataSource>(),
          remoteDataSource: gh<_i11.RemoteDataSource>(),
        ));
    gh.lazySingleton<_i14.IAuthRepository>(() => _i15.AuthRepositoryImpl(
          localDataSource: gh<_i7.LocalDataSource>(),
          remoteDataSource: gh<_i10.RemoteDataSource>(),
        ));
    gh.lazySingleton<_i16.SetAdoptedAnimalsUseCase>(() =>
        _i17.SetAdoptedAnimalsUseCaseImpl(
            animalsRepository: gh<_i12.IAnimalsRepository>()));
    gh.lazySingleton<_i18.GetAdoptedAnimalsUseCase>(() =>
        _i19.GetAdoptedAnimalsUseCaseImpl(
            animalsRepository: gh<_i12.IAnimalsRepository>()));
    gh.lazySingleton<_i20.GetAnimalsUseCase>(() => _i21.GetAnimalsUseCaseImpl(
          animalsRepository: gh<_i12.IAnimalsRepository>(),
          authRepository: gh<_i14.IAuthRepository>(),
        ));
    gh.lazySingleton<_i22.AnimalsCubit>(() => _i22.AnimalsCubit(
          getAnimals: gh<_i20.GetAnimalsUseCase>(),
          getAdoptedAnimals: gh<_i18.GetAdoptedAnimalsUseCase>(),
          setAdoptedAnimals: gh<_i16.SetAdoptedAnimalsUseCase>(),
        ));
    return this;
  }
}
