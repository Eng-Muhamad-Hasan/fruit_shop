part of 'sign_up_cubit.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final UserEntity userEntity;
final String message = "تم إنشاء الحساب بنجاح";
  const SignUpSuccess({required this.userEntity});
  @override
  List<Object> get props => [userEntity,message];
}

final class SignUpFailure extends SignUpState {
  final String message;

  const SignUpFailure({required this.message});
}
