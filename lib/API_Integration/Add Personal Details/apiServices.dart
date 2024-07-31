import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddPersonalDetailsService {
  final String url = 'http://13.127.81.177:8000/api/personal-details/';

  Future<bool> addPersonalDetails(Map<String, dynamic> details) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(details),
      );

      if (response.statusCode == 201) {
        await _storePersonalDetailsLocally(details);
        return true;
      } else {
        print('Failed to add personal details. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error occurred while adding personal details: $e');
      return false;
    }
  }

  Future<void> _storePersonalDetailsLocally(Map<String, dynamic> details) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> existingDetails = prefs.getStringList('personalDetails') ?? [];
    existingDetails.add(jsonEncode(details));
    await prefs.setStringList('personalDetails', existingDetails);
    print('Personal details stored: $existingDetails');
  }

  Future<List<Map<String, String>>> getPersonalDetails() async {
    final prefs = await SharedPreferences.getInstance();
    final details = prefs.getStringList('personalDetails');

    if (details != null) {
      try {
        final decodedDetails = details.map((detail) {
          final Map<String, dynamic> decodedDetail = jsonDecode(detail);
          return decodedDetail.map((key, value) => MapEntry(key, value.toString()));
        }).toList();
        print('Decoded personal details: $decodedDetails');
        return decodedDetails;
      } catch (e) {
        print('Error occurred while decoding personal details: $e');
        return [];
      }
    } else {
      print('No personal details found');
      return [];
    }
  }
}
