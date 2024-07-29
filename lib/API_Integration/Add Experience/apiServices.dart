import 'dart:convert';
import 'package:http/http.dart' as http;

class AddExperienceService {
  final String url = 'http://13.127.81.177:8000/api/experiences/';

  Future<bool> addExperience(Map<String, dynamic> details) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(details),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      print('Failed to add experience: ${response.body}');
      return false;
    }
  }
}
