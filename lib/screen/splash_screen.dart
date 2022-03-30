import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notepad/navigation/router.gr.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        context.router.replace(const LoginScreen());
      } else {
        context.router.replace(const NoteListScreen());
      }
    });

    return Scaffold(
      body: Center(
        child: ClipOval(
          child: Image.asset(
            "assets/images/icon.png",
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
