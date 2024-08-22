import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'token.dart';

class LoginProvider with ChangeNotifier {
  String? _token;

  String? get token => _token;

  Future<void> login(String email, String password, Token servicesList) async {
    const url = 'https://test.kafiil.com/api/test/user/login';

    final headers = {
      'Accept': 'application/json',
      'Accept-Language': 'ar',
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      'email': email,
      'password': password,
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      final responseData = jsonDecode(response.body);
      if (response.statusCode == 200 && responseData['success']) {
        _token = servicesList.token = responseData['access_token'];
        ;
        notifyListeners();
      } else {
        print('Login failed: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
