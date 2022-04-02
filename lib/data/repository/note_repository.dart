import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notepad/data/model/note_model.dart';
import 'package:notepad/data/remote/firestore.dart';

class NoteRepository {
  final FirebaseFirestore _firestore;

  NoteRepository(this._firestore);

  Future<void> insertNote(NoteModel note) async {
    await _firestore.collection(Notes.cName).add({
      Notes.title: note.title,
      Notes.content: note.content,
      Notes.timestamp: FieldValue.serverTimestamp()
    });
  }

  Future<void> updateNote(NoteModel note) async {
    await _firestore
        .collection(Notes.cName)
        .doc(note.id)
        .update({Notes.title: note.title, Notes.content: note.content});
  }

  Future<List<NoteModel>> getNotes() async {
    final snapshot =
        await _firestore.collection(Notes.cName).orderBy(Notes.timestamp, descending: true).get();
    return snapshot.docs
        .map((data) => NoteModel(
            id: data.id,
            title: data[Notes.title],
            content: data[Notes.content],
            timestamp: (data[Notes.timestamp] as Timestamp).toDate()))
        .toList();
  }
}
