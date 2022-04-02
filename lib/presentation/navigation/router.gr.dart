// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../../data/model/note_model.dart' as _i9;
import '../screen/login_screen.dart' as _i2;
import '../screen/note_add_screen.dart' as _i5;
import '../screen/note_edit_screen.dart' as _i6;
import '../screen/note_list_screen.dart' as _i4;
import '../screen/register_screen.dart' as _i3;
import '../screen/splash_screen.dart' as _i1;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    LoginScreen.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginScreen());
    },
    RegisterScreen.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.RegisterScreen());
    },
    NoteListScreen.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.NoteListScreen());
    },
    NoteAddScreen.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.NoteAddScreen());
    },
    NoteEditScreen.name: (routeData) {
      final args = routeData.argsAs<NoteEditScreenArgs>();
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.NoteEditScreen(args.note, key: args.key));
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(SplashScreen.name, path: '/'),
        _i7.RouteConfig(LoginScreen.name, path: '/login-screen'),
        _i7.RouteConfig(RegisterScreen.name, path: '/register-screen'),
        _i7.RouteConfig(NoteListScreen.name, path: '/note-list-screen'),
        _i7.RouteConfig(NoteAddScreen.name, path: '/note-add-screen'),
        _i7.RouteConfig(NoteEditScreen.name, path: '/note-edit-screen')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i7.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '/');

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreen extends _i7.PageRouteInfo<void> {
  const LoginScreen() : super(LoginScreen.name, path: '/login-screen');

  static const String name = 'LoginScreen';
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterScreen extends _i7.PageRouteInfo<void> {
  const RegisterScreen() : super(RegisterScreen.name, path: '/register-screen');

  static const String name = 'RegisterScreen';
}

/// generated route for
/// [_i4.NoteListScreen]
class NoteListScreen extends _i7.PageRouteInfo<void> {
  const NoteListScreen()
      : super(NoteListScreen.name, path: '/note-list-screen');

  static const String name = 'NoteListScreen';
}

/// generated route for
/// [_i5.NoteAddScreen]
class NoteAddScreen extends _i7.PageRouteInfo<void> {
  const NoteAddScreen() : super(NoteAddScreen.name, path: '/note-add-screen');

  static const String name = 'NoteAddScreen';
}

/// generated route for
/// [_i6.NoteEditScreen]
class NoteEditScreen extends _i7.PageRouteInfo<NoteEditScreenArgs> {
  NoteEditScreen({required _i9.NoteModel note, _i8.Key? key})
      : super(NoteEditScreen.name,
            path: '/note-edit-screen',
            args: NoteEditScreenArgs(note: note, key: key));

  static const String name = 'NoteEditScreen';
}

class NoteEditScreenArgs {
  const NoteEditScreenArgs({required this.note, this.key});

  final _i9.NoteModel note;

  final _i8.Key? key;

  @override
  String toString() {
    return 'NoteEditScreenArgs{note: $note, key: $key}';
  }
}
