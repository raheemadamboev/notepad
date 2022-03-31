// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../screen/login_screen.dart' as _i2;
import '../screen/note_list_screen.dart' as _i4;
import '../screen/register_screen.dart' as _i3;
import '../screen/splash_screen.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    LoginScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginScreen());
    },
    RegisterScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.RegisterScreen());
    },
    NoteListScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.NoteListScreen());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(SplashScreen.name, path: '/'),
        _i5.RouteConfig(LoginScreen.name, path: '/login-screen'),
        _i5.RouteConfig(RegisterScreen.name, path: '/register-screen'),
        _i5.RouteConfig(NoteListScreen.name, path: '/note-list-screen')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i5.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '/');

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreen extends _i5.PageRouteInfo<void> {
  const LoginScreen() : super(LoginScreen.name, path: '/login-screen');

  static const String name = 'LoginScreen';
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterScreen extends _i5.PageRouteInfo<void> {
  const RegisterScreen() : super(RegisterScreen.name, path: '/register-screen');

  static const String name = 'RegisterScreen';
}

/// generated route for
/// [_i4.NoteListScreen]
class NoteListScreen extends _i5.PageRouteInfo<void> {
  const NoteListScreen()
      : super(NoteListScreen.name, path: '/note-list-screen');

  static const String name = 'NoteListScreen';
}
