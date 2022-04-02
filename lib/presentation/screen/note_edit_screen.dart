import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepad/data/model/note_model.dart';
import 'package:notepad/injection/injectable_config.dart';

import '../viewmodel/note_edit/note_edit_cubit.dart';

class NoteEditScreen extends StatefulWidget {
  final NoteModel note;
  final void Function(bool) onRefresh;

  const NoteEditScreen({Key? key, required this.note, required this.onRefresh}) : super(key: key);

  @override
  State<NoteEditScreen> createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  late final TextEditingController _title;
  late final TextEditingController _content;

  @override
  void initState() {
    super.initState();
    _title = TextEditingController(text: widget.note.title);
    _content = TextEditingController(text: widget.note.content);
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
      create: (context) => inject<NoteEditCubit>(),
      child: BlocConsumer<NoteEditCubit, NoteEditState>(
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
            orElse: () {},
          );
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Edit note"),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                state.maybeWhen(
                  loading: () {},
                  orElse: () {
                    context.read<NoteEditCubit>().onUpdateNote(
                        id: widget.note.id!, title: _title.text, content: _content.text);
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
                    )
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
