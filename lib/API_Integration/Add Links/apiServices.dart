import 'dart:convert';
import 'package:http/http.dart' as http;

class AddLinksService {
  final String url = 'http://13.127.81.177:8000/api/links/';

  Future<bool> addLinks(Map<String, String> details) async {
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
        print('Failed to add links. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error occurred while adding links: $e');
      return false;
    }
  }
}
