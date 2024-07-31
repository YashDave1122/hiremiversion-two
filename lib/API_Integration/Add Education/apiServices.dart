import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddEducationService {
  final String url = 'http://13.127.81.177:8000/api/education/';

  Future<bool> addEducation(Map<String, dynamic> details) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(details),
      );

      if (response.statusCode == 201) {
        await _storeEducationDetailsLocally(details);
        return true;
      } else {
        print('Failed to add education details. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error occurred while adding education details: $e');
      return false;
    }
  }

  Future<void> _storeEducationDetailsLocally(Map<String, dynamic> details) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> existingDetails = prefs.getStringList('educationDetails') ?? [];
    existingDetails.add(jsonEncode(details));
    await prefs.setStringList('educationDetails', existingDetails);
    print('Education details stored: $existingDetails');
  }

  Future<List<Map<String, String>>> getEducationDetails() async {
    final prefs = await SharedPreferences.getInstance();
    final details = prefs.getStringList('educationDetails');

    if (details != null) {
      try {
        final decodedDetails = details.map((detail) {
          final Map<String, dynamic> decodedDetail = jsonDecode(detail);
          return decodedDetail.map((key, value) => MapEntry(key, value.toString()));
        }).toList();
        print('Decoded education details: $decodedDetails');
        return decodedDetails;
      } catch (e) {
        print('Error occurred while decoding education details: $e');
        return [];
      }
    } else {
      print('No education details found');
      return [];
    }
  }
}
