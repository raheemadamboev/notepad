import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notepad/data/model/note_model.dart';

class NoteRepository {
  final FirebaseFirestore _firestore;

  NoteRepository(this._firestore);

  Future<List<NoteModel>> getNotes() async {
    final snapshot = await _firestore.collection("notes").get();
    return snapshot.docs
        .map((e) => NoteModel(
            id: e.id, title: e["title"], content: e["content"], timestamp: e["timestamp"]))
        .toList();
  }
}
