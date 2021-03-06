// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/repository/auth_repository.dart' as _i6;
import '../data/repository/note_repository.dart' as _i5;
import '../presentation/viewmodel/login/login_cubit.dart' as _i7;
import '../presentation/viewmodel/note_add/note_add_cubit.dart' as _i8;
import '../presentation/viewmodel/note_edit/note_edit_cubit.dart' as _i9;
import '../presentation/viewmodel/note_list/note_list_cubit.dart' as _i10;
import '../presentation/viewmodel/register/register_cubit.dart' as _i11;
import '../presentation/viewmodel/splash/splash_cubit.dart' as _i12;
import 'injectable_module.dart' as _i14;
import 'injectable_singleton_module.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableSingletonModule = _$InjectableSingletonModule();
  final injectableModule = _$InjectableModule();
  gh.singleton<_i3.FirebaseAuth>(injectableSingletonModule.provideAuth);
  gh.singleton<_i4.FirebaseFirestore>(
      injectableSingletonModule.provideFirestore);
  gh.singleton<_i5.NoteRepository>(injectableSingletonModule
      .provideNoteRepository(get<_i4.FirebaseFirestore>()));
  gh.singleton<_i6.AuthRepository>(
      injectableSingletonModule.provideAuthRepository(get<_i3.FirebaseAuth>()));
  gh.factory<_i7.LoginCubit>(
      () => injectableModule.provideLoginCubit(get<_i6.AuthRepository>()));
  gh.factory<_i8.NoteAddCubit>(
      () => injectableModule.provideNoteAddCubit(get<_i5.NoteRepository>()));
  gh.factory<_i9.NoteEditCubit>(
      () => injectableModule.provideNoteEditCubit(get<_i5.NoteRepository>()));
  gh.factory<_i10.NoteListCubit>(
      () => injectableModule.provideNoteListCubit(get<_i5.NoteRepository>()));
  gh.factory<_i11.RegisterCubit>(
      () => injectableModule.provideRegisterCubit(get<_i6.AuthRepository>()));
  gh.factory<_i12.SplashCubit>(
      () => injectableModule.provideSplashCubit(get<_i6.AuthRepository>()));
  return get;
}

class _$InjectableSingletonModule extends _i13.InjectableSingletonModule {}

class _$InjectableModule extends _i14.InjectableModule {}
