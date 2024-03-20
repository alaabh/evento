import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class UserService {
  final box = GetStorage();
  static String gatewayUrl = 'http://localhost:8111';

  static Future<http.Response> login(String email, String password) async {
    return await http.post(Uri.parse("$gatewayUrl/api/auth/login"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({'email': email, 'password': password}),);
  }
}
