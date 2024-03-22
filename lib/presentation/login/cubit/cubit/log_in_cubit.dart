import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';

import '../../../../services/login_service.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  late String? token;
  final box = GetStorage();
  LogInCubit() : super(LogInInitial());
  void Login(String email, String password) async {
    emit(LoginLoading());

    await UserService.login(email, password).then((response) async {
      dynamic responseData = response.body;
      print(responseData);

      if (response.statusCode == 200) {
        token = responseData.toString();

        box.write("access_token", token);

        emit(LoginSuccess());
      } else {
        emit(LoginFailed());
      }
    });
  }

  void requestPassword(String email) async {
    emit(RequstPasswordLoading());

    await UserService.requestPassword(email).then((response) async {
      dynamic responseData = response.body;
      print(responseData);

      if (response.statusCode == 200) {
       

        emit(RequstPasswordSuccess());
      } else {
        emit(RequstPasswordFailed());
      }
    });
  }
  void resetPassword(String password,String token) async {
    emit(ResetPasswordLoading());

    await UserService.resetPassword(password,token).then((response) async {
      dynamic responseData = response.body;
      print(responseData);

      if (response.statusCode == 200) {


        emit(ResetPasswordSuccess());
      } else {
        emit(ResetPasswordFailed());
      }
    });
  }
  void linkExpiration(String token) async {
    emit(NotExpiredLinkFailed());

    await UserService.verifyExpiration(token).then((response) async {

      if (response.statusCode == 200) {

        emit(NotExpiredLinkSuccess());
      } else {
        emit(NotExpiredLinkFailed());
      }
    });
  }
}
