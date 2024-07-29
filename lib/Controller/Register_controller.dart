// registration_controller.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/register_model.dart';

class RegistrationController {
  static const String _baseUrl = 'http://13.127.81.177:8000/api';

  Future<bool> registerUser(User user) async {
    try {
      var url = Uri.parse('$_baseUrl/registers/');
      var response = await http.post(
        url,
        body: jsonEncode(user.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        print( "${response.body}");
        print( "${response.statusCode}");
        return true; // Registration successful
      } else {
        // Handle errors based on response.statusCode
        print( "${response.body}");

        print('Error hai bro ${response.statusCode}: ${response.body}');
        return false; // Registration failed
      }
    } catch (e) {
      // Handle network or server errors
      print('Error sending request: $e');
      return false; // Registration failed
    }
  }
}
