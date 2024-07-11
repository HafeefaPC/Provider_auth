import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  String? _token;

  String? get token => _token;

  Future<void> login(String username, String password) async {
    final url = 'https://dummyjson.com/auth/login';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        _token = responseData['token'];
        notifyListeners();

    
        print('Logged in successfully!');
        print('User data: $responseData');
      } else {
        throw Exception('Failed to login');
      }
    } catch (error) {
      print('Error: $error');
      rethrow;
    }
  }

}
