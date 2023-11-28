part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

final class LoginInitial extends LoginState {}

class UserLoginLoadState extends LoginState{}

class UserLoginSuccessState extends LoginState{}

class UserLoginFailureState extends LoginState{}


