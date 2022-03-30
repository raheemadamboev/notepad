import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notepad/navigation/router.gr.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController mail;
  late final TextEditingController password;

  @override
  void initState() {
    super.initState();
    mail = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    mail.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: mail,
              autocorrect: false,
              enableSuggestions: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: "Enter your mail"),
            ),
            TextField(
              controller: password,
              autocorrect: false,
              enableSuggestions: false,
              obscureText: true,
              decoration: const InputDecoration(hintText: "Enter your password"),
            ),
            TextButton(onPressed: () {}, child: const Text("Login")),
            TextButton(
                onPressed: () {
                  context.router.push(const RegisterScreen());
                },
                child: const Text("Register")),
          ],
        ),
      ),
    );
  }
}
