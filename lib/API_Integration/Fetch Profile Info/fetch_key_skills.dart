import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchKeySkillsService {
  final String url = 'http://13.127.81.177:8000/api/key-skills/';

  Future<List<String>> fetchKeySkills(int profileId) async {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> skillsList = json.decode(response.body);
      final keySkills = skillsList
          .where((skill) => skill['profile'] == profileId)
          .map<String>((skill) => skill['skill'] as String)
          .toList();
      print(keySkills);
      return keySkills;
    } else {
      print('Failed to fetch key skills: ${response.body}');
      return [];
    }
  }
}
