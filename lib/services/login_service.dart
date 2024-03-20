import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class UserService {
  final box = GetStorage();
  static String gatewayUrl = "https://10.0.2.2:8111";

  static Future<http.Response> login(String email, String password) async {
    return await http.post(Uri.parse(gatewayUrl + "/api/auth/login"),
        headers: {
          "Content-type": "application/json",
         
        },
        body: json.encode({"username": email, "password": password}));
  }
}
