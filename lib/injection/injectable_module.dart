import 'package:injectable/injectable.dart';
import 'package:notepad/data/repository/auth_repository.dart';
import 'package:notepad/presentation/viewmodel/login/login_cubit.dart';
import 'package:notepad/presentation/viewmodel/register/register_cubit.dart';

@module
abstract class InjectableModule {
  @injectable
  LoginCubit loginCubit(AuthRepository repository) => LoginCubit(repository);

  @injectable
  RegisterCubit registerCubit(AuthRepository repository) => RegisterCubit(repository);
}
