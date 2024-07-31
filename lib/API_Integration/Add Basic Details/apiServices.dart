import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddBasicDetailsService {
  final String url = 'http://13.127.81.177:8000/api/basic-details/';
//dsdsdsdsdsds/dsds
  Future<bool> addBasicDetails(Map<String, String> details) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(details),
      );

      if (response.statusCode == 201) {
        await _storeBasicDetailsLocally(details);
        return true;
      } else {
        print('Failed to add details. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error occurred while adding details: $e');
      return false;
    }
  }

  Future<void> _storeBasicDetailsLocally(Map<String, String> details) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('basicDetails', jsonEncode(details));
  }

  Future<Map<String, String>> getBasicDetails() async {
    final prefs = await SharedPreferences.getInstance();
    final String? details = prefs.getString('basicDetails');
    if (details != null) {
      return Map<String, String>.from(jsonDecode(details));
    } else {
      return {};
    }
  }
}
