import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notepad/data/repository/auth_repository.dart';

part 'splash_cubit.freezed.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final AuthRepository _repository;

  SplashCubit(this._repository) : super(const SplashState.loading()) {
    onCheckUser();
  }

  Future<void> onCheckUser() async {
    final authenticated = await _repository.userAuthenticated();
    authenticated ? emit(const SplashState.success()) : emit(const SplashState.authenticate());
  }
}
