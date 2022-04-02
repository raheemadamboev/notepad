import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notepad/core/exception/login_exception.dart';
import 'package:notepad/data/repository/auth_repository.dart';

part 'login_cubit.freezed.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _repository;

  LoginCubit(this._repository) : super(const LoginState.initial());

  Future<void> onLogin({required String mail, required String password}) async {
    try {
      emit(const LoginState.loading());
      await _repository.login(mail: mail, password: password);
      emit(const LoginState.success());
    } on LoginException catch (e) {
      emit(LoginState.error(message: e.message));
    }
  }
}
