part of 'log_in_cubit.dart';

@immutable
sealed class LogInState {}

final class LogInInitial extends LogInState {}
class LoginSuccess extends LogInState {}
class LoginFailed extends LogInState {}
class LoginLoading extends LogInState {}
class RequstPasswordSuccess extends LogInState {}
class RequstPasswordFailed extends LogInState {}
class RequstPasswordLoading extends LogInState {}
class ResetPasswordSuccess extends LogInState {}
class ResetPasswordFailed extends LogInState {}
class ResetPasswordLoading extends LogInState {}
