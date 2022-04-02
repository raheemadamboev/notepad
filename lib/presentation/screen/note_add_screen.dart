import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepad/injection/injectable_config.dart';

import '../viewmodel/note_add/note_add_cubit.dart';

class NoteAddScreen extends StatefulWidget {
  final void Function(bool) onRefresh;

  const NoteAddScreen({Key? key, required this.onRefresh}) : super(key: key);

  @override
  State<NoteAddScreen> createState() => _NoteAddScreenState();
}

class _NoteAddScreenState extends State<NoteAddScreen> {
  late final TextEditingController _title;
  late final TextEditingController _content;

  @override
  void initState() {
    super.initState();
    _title = TextEditingController();
    _content = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _title.dispose();
    _content.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<NoteAddCubit>(),
      child: BlocConsumer<NoteAddCubit, NoteAddState>(
        listener: (context, state) {
          state.maybeWhen(
              success: () {
                widget.onRefresh(true);
                context.router.pop();
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
              title: const Text("Add note"),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                state.maybeWhen(
                  loading: () {},
                  orElse: () {
                    context
                        .read<NoteAddCubit>()
                        .onInsertNote(title: _title.text, content: _content.text);
                  },
                );
              },
              child: const Icon(Icons.done),
            ),
            body: state.maybeWhen(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              orElse: () => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      controller: _title,
                      decoration: const InputDecoration(hintText: "Title"),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        maxLines: null,
                        minLines: null,
                        expands: true,
                        controller: _content,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(hintText: "Content"),
                      ),
                    ),
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
