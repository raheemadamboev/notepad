import 'package:flutter/material.dart';

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
              decoration:
                  const InputDecoration(hintText: "Enter your password"),
            ),
            TextButton(onPressed: () {}, child: const Text("Register"))
          ],
        ),
      ),
    );
  }
}
