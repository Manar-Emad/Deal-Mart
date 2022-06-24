part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginState {
   final String error;

  LoginErrorState(this.error);
}

class AppCreateUserSuccessState extends LoginState {
  final String uid;

  AppCreateUserSuccessState(this.uid);
}

class AppCreateUserErrorState extends LoginState {
  final String error;

  AppCreateUserErrorState(this.error);
}

class ChangePasswordVisibilityState extends LoginState {}
