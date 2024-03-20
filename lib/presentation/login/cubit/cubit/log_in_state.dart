part of 'log_in_cubit.dart';

@immutable
sealed class LogInState {}

final class LogInInitial extends LogInState {}
class LoginSuccess extends LogInState {}
class LoginFailed extends LogInState {}
class LoginLoading extends LogInState {}
