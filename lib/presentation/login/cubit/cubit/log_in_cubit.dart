import 'package:bloc/bloc.dart';
import 'package:evento/services/login_service.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitial());
  late String? token;
  final box = GetStorage();
  Future<void> Login(String email, String password) async {
    emit(LoginLoading());

    await UserService.login(email, password).then((response) async {
      final dynamic responseData = response.body;
      print(responseData);

      if (response.statusCode == 200) {
        token = responseData.toString();

        box.write('access_token', token);

        emit(LoginSuccess());
      } else {
        emit(LoginFailed());
      }
    });
  }

  Future<void> requestPassword(String email) async {
    emit(RequstPasswordLoading());

    await UserService.requestPassword(email).then((response) async {
      final dynamic responseData = response.body;
      print(responseData);

      if (response.statusCode == 200) {
       

        emit(RequstPasswordSuccess());
      } else {
        emit(RequstPasswordFailed());
      }
    });
  }
  Future<void> resetPassword(String password,String token) async {
    emit(ResetPasswordLoading());

    await UserService.resetPassword(password,token).then((response) async {
      final dynamic responseData = response.body;
      print(responseData);

      if (response.statusCode == 200) {


        emit(ResetPasswordSuccess());
      } else {
        emit(ResetPasswordFailed());
      }
    });
  }
  Future<void> linkExpiration(String token) async {
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
