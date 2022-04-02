import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:notepad/data/repository/note_repository.dart';

import '../data/repository/auth_repository.dart';

@module
abstract class InjectableSingletonModule {
  @singleton
  FirebaseAuth get auth => FirebaseAuth.instance;

  @singleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @singleton
  AuthRepository authRepository(FirebaseAuth auth) => AuthRepository(auth);

  @singleton
  NoteRepository noteRepository(FirebaseFirestore firestore) => NoteRepository(firestore);
}
