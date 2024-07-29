import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchEducationService {
  final String baseUrl = 'http://13.127.81.177:8000/api';

  Future<List<Map<String, String>>> fetchEducation(int profileId) async {
    final response = await http.get(Uri.parse('$baseUrl/education'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      print(data);
      List<dynamic> filteredData = data.where((item) => item['profile'] == profileId).toList();
      print(filteredData);
      return filteredData.map((item) => {
        'course': item['degree'] as String,
        'place': item['institution'] as String,
        'duration': item['passing_year'].toString(),
      }).toList();
    } else {
      throw Exception('Failed to load education');
    }
  }
}
