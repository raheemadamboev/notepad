import 'package:firebase_auth/firebase_auth.dart';
import 'package:notepad/core/exception/login_exception.dart';
import 'package:notepad/core/exception/register_exception.dart';

class AuthRepository {
  final FirebaseAuth _auth;

  const AuthRepository(this._auth);

  /// intentional delay to show splash screen
  Future<bool> userAuthenticated() async {
    await Future.delayed(const Duration(seconds: 1));
    final user = _auth.currentUser;
    return user != null;
  }

  Future<void> login({required String mail, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: mail, password: password);
    } on FirebaseAuthException catch (e) {
      throw LoginException.fromCode(e.code);
    } catch (_) {
      throw const LoginException();
    }
  }

  Future<void> register({required String mail, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: mail, password: password);
    } on FirebaseAuthException catch (e) {
      throw RegisterException.fromCode(e.code);
    } catch (_) {
      throw const RegisterException();
    }
  }
}
