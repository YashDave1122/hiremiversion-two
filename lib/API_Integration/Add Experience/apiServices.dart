import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddExperienceService {
  final String url = 'http://13.127.81.177:8000/api/experiences/';

  Future<bool> addExperience(Map<String, dynamic> details) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(details),
      );

      if (response.statusCode == 201) {
        await _storeExperienceDetailsLocally(details);
        return true;
      } else {
        print('Failed to add experience details. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error occurred while adding experience details: $e');
      return false;
    }
  }

  Future<void> _storeExperienceDetailsLocally(Map<String, dynamic> details) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> existingDetails = prefs.getStringList('experienceDetails') ?? [];
    existingDetails.add(jsonEncode(details));
    await prefs.setStringList('experienceDetails', existingDetails);
    print('Experience details stored: $existingDetails');
  }

  Future<List<Map<String, String>>> getExperienceDetails() async {
    final prefs = await SharedPreferences.getInstance();
    final details = prefs.getStringList('experienceDetails');

    if (details != null) {
      try {
        final decodedDetails = details.map((detail) {
          final Map<String, dynamic> decodedDetail = jsonDecode(detail);
          return decodedDetail.map((key, value) => MapEntry(key, value.toString()));
        }).toList();
        print('Decoded experience details: $decodedDetails');
        return decodedDetails;
      } catch (e) {
        print('Error occurred while decoding experience details: $e');
        return [];
      }
    } else {
      print('No experience details found');
      return [];
    }
  }
}
