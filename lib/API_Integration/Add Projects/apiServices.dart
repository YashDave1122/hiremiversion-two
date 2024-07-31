import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddProjectsService {
  final String url = 'http://13.127.81.177:8000/api/projects/';

  Future<bool> addProject(Map<String, dynamic> details) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(details),
    );

    if (response.statusCode == 201) {
      // Store the project locally
      await _storeProjectLocally(details);
      return true;
    } else {
      print('Failed to add project: ${response.body}');
      return false;
    }
  }

  Future<void> _storeProjectLocally(Map<String, dynamic> project) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? projects = prefs.getStringList('projects') ?? [];
    projects.add(json.encode(project));
    await prefs.setStringList('projects', projects);
  }

  Future<List<Map<String, dynamic>>> getProjects() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? projects = prefs.getStringList('projects') ?? [];
    return projects.map((project) => json.decode(project) as Map<String, dynamic>).toList();
  }
}
