import 'package:auto_route/annotations.dart';
import 'package:notepad/presentation/screen/login_screen.dart';
import 'package:notepad/presentation/screen/note_add_screen.dart';
import 'package:notepad/presentation/screen/note_edit_screen.dart';
import 'package:notepad/presentation/screen/note_list_screen.dart';
import 'package:notepad/presentation/screen/register_screen.dart';
import 'package:notepad/presentation/screen/splash_screen.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(page: SplashScreen, initial: true),
  AutoRoute(page: LoginScreen),
  AutoRoute(page: RegisterScreen),
  AutoRoute(page: NoteListScreen),
  AutoRoute(page: NoteAddScreen),
  AutoRoute(page: NoteEditScreen)
])
class $AppRouter {}
