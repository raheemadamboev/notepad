import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepad/injection/injectable_config.dart';
import 'package:notepad/presentation/navigation/router.gr.dart';

import '../viewmodel/register/register_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
      create: (context) => inject<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          state.maybeWhen(
              success: () {
                context.router.replaceAll([const NoteListScreen()]);
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
              title: const Text("Register"),
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
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      enableSuggestions: false,
                      controller: _mail,
                      decoration: const InputDecoration(hintText: "Enter your mail"),
                    ),
                    TextField(
                      obscureText: true,
                      autocorrect: false,
                      enableSuggestions: false,
                      controller: _password,
                      decoration: const InputDecoration(hintText: "Enter your password"),
                    ),
                    TextButton(
                        onPressed: () {
                          context
                              .read<RegisterCubit>()
                              .onRegister(mail: _mail.text, password: _password.text);
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
