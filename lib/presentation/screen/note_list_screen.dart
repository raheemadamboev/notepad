import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepad/injection/injectable_config.dart';
import 'package:notepad/presentation/navigation/router.gr.dart';

import '../viewmodel/note_list/note_list_cubit.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({Key? key}) : super(key: key);

  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<NoteListCubit>(),
      child: BlocConsumer<NoteListCubit, NoteListState>(
        listener: (context, state) {
          state.maybeWhen(
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
              title: const Text("Notes"),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.router.push(
                  NoteAddScreen(
                    onRefresh: (refresh) {
                      if (refresh) context.read<NoteListCubit>().onGetNotes();
                    },
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
            body: state.when(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (message) => Center(
                child: Text(message),
              ),
              success: (notes) => GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    child: InkWell(
                      onTap: () {
                        context.router.push(NoteEditScreen(note: notes[index]));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              notes[index].title,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const Padding(padding: EdgeInsets.only(top: 16)),
                            Text(notes[index].content, textAlign: TextAlign.start, maxLines: 5),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
