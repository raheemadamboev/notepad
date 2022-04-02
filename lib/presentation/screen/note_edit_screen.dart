import 'package:flutter/material.dart';
import 'package:notepad/data/model/note_model.dart';

class NoteEditScreen extends StatefulWidget {
  final NoteModel _note;

  const NoteEditScreen(this._note, {Key? key}) : super(key: key);

  @override
  State<NoteEditScreen> createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
