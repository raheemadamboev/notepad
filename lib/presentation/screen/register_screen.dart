import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../navigation/router.gr.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController mail;
  late final TextEditingController password;

  @override
  void initState() {
    super.initState();
    mail = TextEditingController();
    password = TextEditingController();
    observeAuth();
  }

  @override
  void dispose() {
    mail.dispose();
    password.dispose();
    super.dispose();
  }

  void observeAuth() async {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) context.router.replaceAll([const NoteListScreen()]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              enableSuggestions: false,
              controller: mail,
              decoration: const InputDecoration(hintText: "Enter your mail"),
            ),
            TextField(
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              controller: password,
              decoration: const InputDecoration(hintText: "Enter your password"),
            ),
            TextButton(
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: mail.text, password: password.text);
                  } on FirebaseAuthException catch (e) {
                  }
                },
                child: const Text("Register"))
          ],
        ),
      ),
    );
  }
}
