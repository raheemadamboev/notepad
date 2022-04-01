import 'package:firebase_auth/firebase_auth.dart';
import 'package:notepad/core/exception/login_exception.dart';
import 'package:notepad/core/exception/register_exception.dart';

class AuthRepository {
  final FirebaseAuth auth;

  const AuthRepository({required this.auth});

  Future<void> login({required String mail, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: mail, password: password);
    } on FirebaseAuthException catch (e) {
      throw LoginException.fromCode(e.code);
    } catch (_) {
      throw const LoginException();
    }
  }

  Future<void> register({required String mail, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(email: mail, password: password);
    } on FirebaseAuthException catch (e) {
      throw RegisterException.fromCode(e.code);
    } catch (_) {
      throw const RegisterException();
    }
  }
}
