
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:hiremi_version_two/API_Integration/Internship/Apiservices.dart';
import 'package:hiremi_version_two/Custom_Widget/OppurtunityCard.dart';
import 'package:hiremi_version_two/Notofication_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InternshipsScreen extends StatefulWidget {
  const InternshipsScreen({Key? key, required this.isVerified}) : super(key: key);
  final bool isVerified;

  @override
  State<InternshipsScreen> createState() => _InternshipsScreenState();
}

class _InternshipsScreenState extends State<InternshipsScreen> {
  late Future<List<dynamic>> futureJobs;
  late Future<List<dynamic>> futureApplications;
  int? userId;

  @override
  void initState() {
    super.initState();
    _retrieveId();
    futureJobs = _fetchJobs();
    futureApplications = _fetchApplications();
  }

  Future<void> _retrieveId() async {
    final prefs = await SharedPreferences.getInstance();
    final int? savedId = prefs.getInt('userId');
    if (savedId != null) {
      setState(() {
        userId = savedId;
      });
      print("Retrieved id is $savedId");
    } else {
      print("No id found in SharedPreferences");
    }
  }

  Future<List<dynamic>> _fetchJobs() async {
    final apiService = ApiService('http://13.127.81.177:8000/api/internship/');
    final jobs = await apiService.fetchData();
    return jobs;
  }

  Future<List<dynamic>> _fetchApplications() async {
    final apiService = ApiService('http://13.127.81.177:8000/api/internship-applications/');
    return await apiService.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Internship Jobs',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const NotificationScreen()));
              },
              icon: const Icon(Icons.notifications))
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: Future.wait([futureJobs, futureApplications]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No jobs available'));
          } else {
            final jobs = snapshot.data![0];
            final applications = snapshot.data![1];

            // Check which jobs the user has already applied for
            final appliedJobs = applications
                .where((application) => application['register'] == userId)
                .map((application) => application['internship'])
                .toSet();

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.04), // 4% of screen width
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        width: screenWidth * 0.95, // 95% of screen width
                        height: screenHeight * 0.1, // 10% of screen height
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFC3E41), Color(0xFFFF6E01)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: screenWidth * 0.04, // 4% of screen width
                            ),
                            Container(
                              width: screenWidth * 0.08, // 8% of screen width
                              height: screenWidth * 0.08, // 8% of screen width
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.work,
                                size: screenWidth * 0.04, // 4% of screen width
                                color: const Color(0xFFFF3E41),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.02, // 2% of screen width
                            ),
                            Text(
                              'Internship Jobs',
                              style: TextStyle(
                                fontSize: screenWidth * 0.045, // 4.5% of screen width
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              width: screenWidth * 0.23, // 23% of screen width
                              height: screenWidth * 0.23, // 23% of screen width
                              decoration: BoxDecoration(
                                color: Colors.red[100],
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.work,
                                color: const Color(0xFFFF3E41),
                                size: screenWidth * 0.1, // 10% of screen width
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03, // 3% of screen height
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Available Internship Jobs',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03, // 3% of screen height
                      ),
                      Column(
                        children: jobs.map<Widget>((job) {
                          bool isApplied = appliedJobs.contains(job['id']);
                          return Padding(
                            padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                            child: OpportunityCard(
                              id: job['id'],
                              dp: Image.asset('images/icons/logo1.png'), // Placeholder image
                              profile: job['profile'] ?? 'N/A',
                              companyName: job['company_name'] ?? 'N/A',
                              location: job['location'] ?? 'N/A',
                              stipend: job['Stipend']?.toString() ?? 'N/A',
                              mode: 'Remote', // Replace with actual data if available
                              type: 'Internships', // Replace with actual data if available
                              exp: 1, // Replace with actual data if available
                              daysPosted: 0, // Replace with actual data if available
                              isVerified: widget.isVerified,
                              ctc: job['Stipend']?.toString() ?? '0', // Example, replace with actual field
                              description: job['description'] ?? 'No description available',
                              education: job['education'],
                              skillsRequired: job['skills_required'],
                              whoCanApply: job['who_can_apply'],
                              isApplied: isApplied, // Indicate if already applied
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
