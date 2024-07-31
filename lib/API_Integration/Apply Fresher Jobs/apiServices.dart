import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../SuccesfullyAppliedalert.dart';

class ApiServices {
  static const String baseUrl = 'http://13.127.81.177:8000/api';


  static Future<void> applyForJob(int jobId, BuildContext context) async {
    String profileId="";
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // final String? profileId = prefs.getString('profileId');
    final prefs = await SharedPreferences.getInstance();
    final int? savedId = prefs.getInt('userId');
    if (savedId != null) {
      print("Retrieved id is $savedId");
      profileId=savedId.toString();
    } else {
      print("No id found in SharedPreferences");
    }

    if (profileId == null) {
      throw Exception('Profile ID not found in shared preferences');
    }

    try {
      final profileUrl = '$baseUrl/profiles/$profileId';
      final profileResponse = await http.get(Uri.parse(profileUrl));
      if (profileResponse.statusCode != 200) {
        throw Exception('Failed to load profile: ${profileResponse.body}');
      }
      final profileData = jsonDecode(profileResponse.body);
      final String registerValue = profileData['register'].toString();

      // Prepare the payload for the job application
      final applicationData = {
        'candidate_status': 'Applied',
        'register': profileId,
        'fresherjob': jobId.toString(),
      };
      print(applicationData);

      // Post the application data
      final applicationUrl = '$baseUrl/job-applications/';
      final response = await http.post(
        Uri.parse(applicationUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(applicationData),
      );

      if (response.statusCode != 201) {
        print(response.statusCode);
        throw Exception('Failed to apply for the job: ${response.body}');
      }

      // Show the SuccessfullyAppliedAlert dialog
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                contentPadding: EdgeInsets.zero,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                content: const SuccessfullyAppliedAlert());
          },
        );
    } catch (error) {
      print('Error in applyForJob: $error');
      throw Exception('Failed to apply for the job: $error');
    }
  }
  static Future<void> applyForInternship(int InternshipId, BuildContext context) async {
    String profileId="";
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // final String? profileId = prefs.getString('profileId');
    final prefs = await SharedPreferences.getInstance();
    final int? savedId = prefs.getInt('userId');
    if (savedId != null) {
      print("Retrieved id is $savedId");
      profileId=savedId.toString();
    } else {
      print("No id found in SharedPreferences");
    }

    if (profileId == null) {
      throw Exception('Profile ID not found in shared preferences');
    }

    try {
      final profileUrl = '$baseUrl/profiles/$profileId';
      final profileResponse = await http.get(Uri.parse(profileUrl));
      if (profileResponse.statusCode != 200) {
        throw Exception('Failed to load profile: ${profileResponse.body}');
      }
      final profileData = jsonDecode(profileResponse.body);
      final String registerValue = profileData['register'].toString();

      // Prepare the payload for the job application
      final applicationData = {
        'candidate_status': 'Applied',
        'register': profileId,
        'internship': InternshipId.toString(),
      };
      print(applicationData);

      // Post the application data
      final applicationUrl = '$baseUrl/internship-applications/';
      final response = await http.post(
        Uri.parse(applicationUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(applicationData),
      );

      if (response.statusCode != 201) {
        print(response.statusCode);
        throw Exception('Failed to apply for the job: ${response.body}');
      }

      // Show the SuccessfullyAppliedAlert dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              contentPadding: EdgeInsets.zero,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              content: const SuccessfullyAppliedAlert());
        },
      );
    } catch (error) {
      print('Error in applyForInternship: $error');
      throw Exception('Failed to apply for the Internship: $error');
    }
  }
}
