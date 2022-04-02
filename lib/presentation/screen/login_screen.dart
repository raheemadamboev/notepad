import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepad/injection/injectable_config.dart';
import 'package:notepad/presentation/viewmodel/login/login_cubit.dart';

import '../navigation/router.gr.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _mail;
  late final TextEditingController _password;

  @override
  void initState() {
    super.initState();
    _mail = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _mail.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          state.maybeWhen(
              success: () {
                context.router.replace(const NoteListScreen());
              },
              error: (message) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(content: Text(message)));
              },
              orElse: () {});
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Login"),
            ),
            body: state.maybeWhen(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              orElse: () => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _mail,
                      autocorrect: false,
                      enableSuggestions: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(hintText: "Enter your mail"),
                    ),
                    TextField(
                      controller: _password,
                      autocorrect: false,
                      enableSuggestions: false,
                      obscureText: true,
                      decoration: const InputDecoration(hintText: "Enter your password"),
                    ),
                    TextButton(
                        onPressed: () {
                          context
                              .read<LoginCubit>()
                              .onLogin(mail: _mail.text, password: _password.text);
                        },
                        child: const Text("Login")),
                    TextButton(
                        onPressed: () {
                          context.router.push(const RegisterScreen());
                        },
                        child: const Text("Register")),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
