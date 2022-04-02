import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../data/repository/auth_repository.dart';

@module
abstract class InjectableSingletonModule {
  @singleton
  FirebaseAuth get auth => FirebaseAuth.instance;

  @singleton
  AuthRepository authRepository(FirebaseAuth auth) => AuthRepository(auth);
}
