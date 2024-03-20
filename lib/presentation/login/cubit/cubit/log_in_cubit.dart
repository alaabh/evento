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
}
