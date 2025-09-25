import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/feature/auth/domain/entity/user_entity.dart';
import 'package:fruit_shop/feature/auth/domain/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  Future<void> signIn(String email, String password) async {
    emit(LoginLoading());
    final result = await authRepo.signInWithEmailAndPassword(email, password);

    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    final result = await authRepo.signInWithGoogle();

    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
    );
  }


  // Future<void> signInWithFacebook() async {
  //   emit(LoginLoading());
  //   final result = await authRepo.signInWithFacebook();

  //   result.fold(
  //     (failure) => emit(LoginFailure(message: failure.message)),
  //     (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
  //   );
  // }
}
