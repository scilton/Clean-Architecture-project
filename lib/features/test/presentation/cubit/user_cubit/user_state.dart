part of 'user_cubit.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoginLoading extends UserState {}

class UserLoginSuccess extends UserState {}

class UserLoginError extends UserState {}

class UserLogoutSuccessful extends UserState {}

class UserLogoutError extends UserState {}
