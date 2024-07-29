import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchExperienceService {
  final String url = 'http://13.127.81.177:8000/api/experiences/';

  Future<List<Map<String, dynamic>>> fetchExperiences(String profileId) async {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> allExperiences = json.decode(response.body);
      final List<Map<String, dynamic>> userExperiences = allExperiences
          .where((experience) => experience['profile'].toString() == profileId.toString())
          .map((experience) => experience as Map<String, dynamic>)
          .toList();
      print(userExperiences);
      print(profileId);
      return userExperiences;
    } else {
      print('Failed to fetch experiences: ${response.body}');
      return [];
    }
  }
}
