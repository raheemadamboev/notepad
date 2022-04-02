import 'package:injectable/injectable.dart';
import 'package:notepad/data/repository/auth_repository.dart';
import 'package:notepad/data/repository/note_repository.dart';
import 'package:notepad/presentation/viewmodel/login/login_cubit.dart';
import 'package:notepad/presentation/viewmodel/note_add/note_add_cubit.dart';
import 'package:notepad/presentation/viewmodel/note_edit/note_edit_cubit.dart';
import 'package:notepad/presentation/viewmodel/note_list/note_list_cubit.dart';
import 'package:notepad/presentation/viewmodel/register/register_cubit.dart';
import 'package:notepad/presentation/viewmodel/splash/splash_cubit.dart';

@module
abstract class InjectableModule {
  @injectable
  SplashCubit provideSplashCubit(AuthRepository repository) => SplashCubit(repository);

  @injectable
  LoginCubit provideLoginCubit(AuthRepository repository) => LoginCubit(repository);

  @injectable
  RegisterCubit provideRegisterCubit(AuthRepository repository) => RegisterCubit(repository);

  @injectable
  NoteListCubit provideNoteListCubit(NoteRepository repository) => NoteListCubit(repository);

  @injectable
  NoteAddCubit provideNoteAddCubit(NoteRepository repository) => NoteAddCubit(repository);

  @injectable
  NoteEditCubit provideNoteEditCubit(NoteRepository repository) => NoteEditCubit(repository);
}
