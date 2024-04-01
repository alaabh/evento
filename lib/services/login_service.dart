import 'dart:convert';

import 'package:evento/host.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class UserService {
  final box = GetStorage();


  static Future<http.Response> login(String email, String password) async {
    return await http.post(
      Uri.parse('${Host.gatewayUrl}/api/auth/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({'email': email, 'password': password}),
    );
  }

  static Future<http.Response> requestPassword(String email) async {
    return await http.post(
      Uri.parse('${Host.gatewayUrl}/api/auth/request-password'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(email),
    );
  }


 static Future<http.Response> resetPassword(String password, String token) async {
    print(token);
    final queryParameters = <String, String>{
      'token': token,
    };

    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    final body =password;

    final uri = Uri.parse('${Host.gatewayUrl}/api/auth/reset_password');

    return await http.post(
      uri.replace(queryParameters: queryParameters),
      headers: headers,
      body: jsonEncode(body),
    );
  }
  static Future<http.Response> verifyExpiration(String token) async {
    return await http.post(
      Uri.parse('${Host.gatewayUrl}/api/auth/verifyToken/$token'),
      headers: {
        'Content-Type': 'application/json',
      },

    );
  }
}
