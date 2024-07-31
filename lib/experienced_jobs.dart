// // import 'package:flutter/material.dart';
// //
// // class Experienced_Jobs extends StatefulWidget {
// //   const Experienced_Jobs({Key? key, }) : super(key: key);
// //
// //   @override
// //   State<Experienced_Jobs> createState() => _Experienced_JobsState();
// // }
// //
// // class _Experienced_JobsState extends State<Experienced_Jobs> {
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final screenHeight = MediaQuery.of(context).size.height;
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         title: const Text(
// //           "Experienced Jobs",
// //           style: TextStyle(fontWeight: FontWeight.bold),
// //         ),
// //
// //         centerTitle: true,
// //         actions: [
// //           IconButton(
// //             onPressed: () {},
// //             icon: const Icon(Icons.notifications),
// //           ),
// //         ],
// //       ),
// //       body: Column(
// //         children: [
// //           Padding(
// //             padding: const EdgeInsets.all(10.0),
// //             child: Image.asset('images/Frame 110.png'),
// //           ),
// //           Image.asset('images/Team work-bro.png'),
// //           SizedBox(height: screenHeight*0.01,),
// //           const Text(
// //             'Hiremi’s Recruiters are planning for new jobs',
// //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
// //             textAlign: TextAlign.center,
// //           ),
// //           const Text(
// //             'please wait for few days',
// //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
// //             textAlign: TextAlign.center,
// //           ),
// //
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:hiremi_version_two/API_Integration/Internship/Apiservices.dart';
// import 'package:hiremi_version_two/Custom_Widget/OppurtunityCard.dart';
// import 'package:hiremi_version_two/Notofication_screen.dart';
//
// class ExperiencedJobs extends StatefulWidget {
//   const ExperiencedJobs({Key? key, required this.isVerified}) : super(key: key);
//   final bool isVerified;
//   @override
//   State<ExperiencedJobs> createState() => _ExperiencedJobsState();
// }
//
// class _ExperiencedJobsState extends State<ExperiencedJobs> {
//   late Future<List<dynamic>> futureJobs;
//   late Future<List<dynamic>> futureApplications;
//   int? userId;
//
//   @override
//   void initState() {
//     super.initState();
//     futureJobs = _getJobs();
//     futureApplications = _getApplications();
//   }
//
//   Future<List<dynamic>> _getJobs() async {
//     final apiService = ApiService('http://13.127.81.177:8000/api/experiencejob/');
//     return await apiService.fetchData();
//   }
//
//   Future<List<dynamic>> _getApplications() async {
//     final apiService = ApiService('http://13.127.81.177:8000/api/job-applications/');
//     return await apiService.fetchData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text(
//           "Experienced Jobs",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(builder: (ctx) => const NotificationScreen()),
//               );
//             },
//             icon: const Icon(Icons.notifications),
//           ),
//         ],
//       ),
//       body: FutureBuilder<List<dynamic>>(
//         future: Future.wait([futureJobs, futureApplications]),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No jobs available'));
//           } else {
//             final jobs = snapshot.data![0];
//             final applications = snapshot.data![1];
//
//             // Check which jobs the user has already applied for
//             final appliedJobs = applications
//                 .where((application) => application['register'] == userId)
//                 .map((application) => application['experiencejob'])
//                 .toSet();
//
//             return SingleChildScrollView(
//               child: Padding(
//                 padding: EdgeInsets.all(screenWidth * 0.04), // 4% of screen width
//                 child: Center(
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Image.asset('images/Frame 110.png'),
//                       ),
//                       Image.asset('images/Team work-bro.png'),
//                       SizedBox(height: screenHeight * 0.01),
//                       const Text(
//                         'Hiremi’s Recruiters are planning for new jobs',
//                         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
//                         textAlign: TextAlign.center,
//                       ),
//                       const Text(
//                         'please wait for few days',
//                         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(height: screenHeight * 0.03),
//                       Column(
//                         children: jobs.map<Widget>((job) {
//                           bool isApplied = appliedJobs.contains(job['id']);
//                           return Padding(
//                             padding: EdgeInsets.only(bottom: screenHeight * 0.03),
//                             child: OpportunityCard(
//                               id: job['id'],
//                               dp: Image.asset('images/icons/logo1.png'), // Placeholder image
//                               profile: job['profile'] ?? 'N/A',
//                               companyName: job['company_name'] ?? 'N/A',
//                               location: job['location'] ?? 'N/A',
//                               stipend: job['CTC']?.toString() ?? 'N/A',
//                               mode: job['work_environment'] ?? 'N/A',
//                               type: 'Job',
//                               exp: job['years_experience_required'] ?? 0,
//                               daysPosted: 0, // Replace with actual data if available
//                               isVerified: widget.isVerified,
//                               ctc: job['CTC']?.toString() ?? '0', // Example, replace with actual field
//                               description: job['description'] ?? 'No description available',
//                               education: job['education'] ?? 'N/A',
//                               skillsRequired: job['skills_required'] ?? 'N/A',
//                               whoCanApply: job['who_can_apply'] ?? 'N/A',
//                               isApplied: isApplied, // Indicate if already applied
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                       SizedBox(height: screenHeight * 0.35),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hiremi_version_two/API_Integration/Internship/Apiservices.dart';
import 'package:hiremi_version_two/Custom_Widget/OppurtunityCard.dart';
import 'package:hiremi_version_two/Notofication_screen.dart';

class ExperiencedJobs extends StatefulWidget {
  const ExperiencedJobs({Key? key, required this.isVerified}) : super(key: key);
  final bool isVerified;
  @override
  State<ExperiencedJobs> createState() => _ExperiencedJobsState();
}

class _ExperiencedJobsState extends State<ExperiencedJobs> {
  late Future<List<dynamic>> futureJobs;
  late Future<List<dynamic>> futureApplications;
  int? userId;

  @override
  void initState() {
    super.initState();
    futureJobs = _getJobs();
    futureApplications = _getApplications();
  }

  Future<List<dynamic>> _getJobs() async {
    final apiService = ApiService('http://13.127.81.177:8000/api/experiencejob/');
    return await apiService.fetchData();
  }

  Future<List<dynamic>> _getApplications() async {
    final apiService = ApiService('http://13.127.81.177:8000/api/job-applications/');
    return await apiService.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Experienced Jobs",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const NotificationScreen()),
              );
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: Future.wait([futureJobs, futureApplications]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty || snapshot.data![0].isEmpty) {
            // No jobs available
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('images/Frame 110.png'),
                  ),
                  Image.asset('images/Team work-bro.png'),
                  SizedBox(height: screenHeight * 0.01),
                  const Text(
                    'Hiremi’s Recruiters are planning for new jobs',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    'please wait for few days',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          } else {
            final jobs = snapshot.data![0];
            final applications = snapshot.data![1];

            // Check which jobs the user has already applied for
            final appliedJobs = applications
                .where((application) => application['register'] == userId)
                .map((application) => application['experiencejob'])
                .toSet();

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.04), // 4% of screen width
                child: Center(
                  child: Column(
                    children: [
                      Image.asset('images/Frame 110.png'),
                      SizedBox(
                        height: screenHeight * 0.03, // 3% of screen height
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Available Experienced Jobs',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                              stipend: job['CTC']?.toString() ?? 'N/A',
                              mode: job['work_environment'] ?? 'N/A',
                              type: 'Job',
                              exp: job['years_experience_required'] ?? 0,
                              daysPosted: 0, // Replace with actual data if available
                              isVerified: widget.isVerified,
                              ctc: job['CTC']?.toString() ?? '0', // Example, replace with actual field
                              description: job['description'] ?? 'No description available',
                              education: job['education'] ?? 'N/A',
                              skillsRequired: job['skills_required'] ?? 'N/A',
                              whoCanApply: job['who_can_apply'] ?? 'N/A',
                              isApplied: isApplied, // Indicate if already applied
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: screenHeight * 0.35),
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
