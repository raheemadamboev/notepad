import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notepad/data/model/note_model.dart';
import 'package:notepad/data/remote/firestore.dart';

class NoteRepository {
  final FirebaseFirestore _firestore;

  NoteRepository(this._firestore);

  Future<List<NoteModel>> getNotes() async {
    final snapshot = await _firestore.collection(Notes.cName).get();
    return snapshot.docs
        .map((data) => NoteModel(
            id: data.id,
            title: data[Notes.title],
            content: data[Notes.content],
            timestamp: (data[Notes.timestamp] as Timestamp).toDate()))
        .toList();
  }
}
