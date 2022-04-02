// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/repository/auth_repository.dart' as _i4;
import '../presentation/viewmodel/login/login_cubit.dart' as _i5;
import 'injectable_module.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.singleton<_i3.FirebaseAuth>(injectableModule.auth);
  gh.singleton<_i4.AuthRepository>(
      injectableModule.authRepository(get<_i3.FirebaseAuth>()));
  gh.factory<_i5.LoginCubit>(
      () => injectableModule.loginCubit(get<_i4.AuthRepository>()));
  return get;
}

class _$InjectableModule extends _i6.InjectableModule {}
