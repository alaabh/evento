import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class UserService {
  final box = GetStorage();
  static String gatewayUrl = 'http://localhost:8111';

  static Future<http.Response> login(String email, String password) async {
    return await http.post(
      Uri.parse("$gatewayUrl/api/auth/login"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({'email': email, 'password': password}),
    );
  }

  static Future<http.Response> requestPassword(String email) async {
    return await http.post(
      Uri.parse("$gatewayUrl/api/auth/request-password"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(email),
    );
  }

  static Future<http.Response> resetPassword(
      String password, String token) async {
    print(token);
    return await http.post(
      Uri.parse("$gatewayUrl/api/auth/reset_password"),
      headers: {
        'Content-Type': 'application/json',
        'token': token,
      },
      body: json.encode(password),
    );
  }
}
