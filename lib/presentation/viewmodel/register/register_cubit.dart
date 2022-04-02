import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notepad/core/exception/register_exception.dart';
import 'package:notepad/data/repository/auth_repository.dart';

part 'register_cubit.freezed.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _repository;

  RegisterCubit(this._repository) : super(const RegisterState.initial());

  Future<void> onRegister({required String mail, required String password}) async {
    try {
      emit(const RegisterState.loading());
      await _repository.register(mail: mail, password: password);
      emit(const RegisterState.success());
    } on RegisterException catch (e) {
      emit(RegisterState.error(message: e.message));
    }
  }
}
