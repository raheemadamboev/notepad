import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:notepad/data/repository/auth_repository.dart';
import 'package:notepad/presentation/viewmodel/login/login_cubit.dart';

@module
abstract class InjectableModule {
  @singleton
  FirebaseAuth get auth => FirebaseAuth.instance;

  @singleton
  AuthRepository authRepository(FirebaseAuth auth) => AuthRepository(auth: auth);

  @injectable
  LoginCubit loginCubit(AuthRepository repository) => LoginCubit(repository);
}
