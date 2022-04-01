import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:notepad/data/repository/auth_repository.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @lazySingleton
  AuthRepository authRepository(FirebaseAuth auth) => AuthRepository(auth: auth);
}
