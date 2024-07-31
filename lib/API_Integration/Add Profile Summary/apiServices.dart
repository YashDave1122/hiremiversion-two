import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddProfileSummaryService {
  final String url = 'http://13.127.81.177:8000/api/profile-summaries/';

  Future<bool> addProfileSummary(Map<String, String> details) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(details),
      );

      if (response.statusCode == 201) {
        await _storeProfileSummaryLocally(details['summary']!);
        return true;
      } else {
        print('Failed to add profile summary. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error occurred while adding profile summary: $e');
      return false;
    }
  }

  Future<void> _storeProfileSummaryLocally(String summary) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profileSummary', summary);
  }

  Future<String?> getProfileSummary() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('profileSummary');
  }
}
