import 'package:injectable/injectable.dart';
import 'package:notepad/data/repository/auth_repository.dart';
import 'package:notepad/data/repository/note_repository.dart';
import 'package:notepad/presentation/viewmodel/login/login_cubit.dart';
import 'package:notepad/presentation/viewmodel/note_add/note_add_cubit.dart';
import 'package:notepad/presentation/viewmodel/note_list/note_list_cubit.dart';
import 'package:notepad/presentation/viewmodel/register/register_cubit.dart';
import 'package:notepad/presentation/viewmodel/splash/splash_cubit.dart';

@module
abstract class InjectableModule {
  @injectable
  SplashCubit splashCubit(AuthRepository repository) => SplashCubit(repository);

  @injectable
  LoginCubit loginCubit(AuthRepository repository) => LoginCubit(repository);

  @injectable
  RegisterCubit registerCubit(AuthRepository repository) => RegisterCubit(repository);

  @injectable
  NoteListCubit noteListCubit(NoteRepository repository) => NoteListCubit(repository);

  @injectable
  NoteAddCubit noteAddCubit(NoteRepository repository) => NoteAddCubit(repository);
}
