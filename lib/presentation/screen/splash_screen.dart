import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepad/injection/injectable_config.dart';
import 'package:notepad/presentation/navigation/router.gr.dart';

import '../viewmodel/splash/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<SplashCubit>(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          state.when(
            loading: () {},
            authenticate: () {
              context.router.replace(const LoginScreen());
            },
            success: () {
              context.router.replace(const NoteListScreen());
            },
          );
        },
        child: Scaffold(
          body: Center(
            child: ClipOval(
              child: Image.asset(
                "assets/images/icon.png",
                width: 200,
                height: 200,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
