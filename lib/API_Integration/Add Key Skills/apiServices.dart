import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddKeySkillsService {
  final String url = 'http://13.127.81.177:8000/api/key-skills/';

  Future<bool> addKeySkills(Map<String, String> details) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(details),
      );

      if (response.statusCode == 201) {
        await _storeKeySkillsLocally(details['skill']!);
        return true;
      } else {
        print('Failed to add key skills. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {

      print('Error occurred while adding key skills: $e');
      return false;
    }
  }

  Future<void> _storeKeySkillsLocally(String skills) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('keySkills', skills);
  }

  Future<List<String>> getKeySkills() async {
    final prefs = await SharedPreferences.getInstance();
    final String? skills = prefs.getString('keySkills');
    if (skills != null) {
      return skills.split(',').map((skill) => skill.trim()).toList();
    } else {
      return [];
    }
  }
}
