import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:notepad/data/repository/auth_repository.dart';

@module
abstract class InjectableModule {
  @singleton
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @singleton
  AuthRepository authRepository(FirebaseAuth auth) => AuthRepository(auth: auth);
}
