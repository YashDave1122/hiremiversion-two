// resume_api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ResumeApiService {
  final String url = 'http://13.127.81.177:8000/api/resumelink/';

  Future<bool> saveResumeLink(Map<String, dynamic> details) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(details),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        print('Failed to save resume link: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error occurred while saving resume link: $e');
      return false;
    }
  }
}
