import 'package:auto_route/annotations.dart';
import 'package:notepad/screen/login_screen.dart';
import 'package:notepad/screen/note_list_screen.dart';
import 'package:notepad/screen/register_screen.dart';
import 'package:notepad/screen/splash_screen.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(page: SplashScreen, initial: true),
  AutoRoute(page: LoginScreen),
  AutoRoute(page: RegisterScreen),
  AutoRoute(page: NoteListScreen)
])
class $AppRouter {}
