import 'package:flutter/material.dart';
import 'package:hiremi_version_two/API_Integration/Internship/Apiservices.dart';
import 'package:hiremi_version_two/Custom_Widget/OppurtunityCard.dart';
import 'package:hiremi_version_two/Notofication_screen.dart';

class FresherJobs extends StatefulWidget {
  const FresherJobs({Key? key, required this.isVerified}) : super(key: key);
  final bool isVerified;

  @override
  State<FresherJobs> createState() => _FresherJobsState();
}

class _FresherJobsState extends State<FresherJobs> {
  late Future<List<dynamic>> futureJobs;
  @override
  void initState() {
    super.initState();
    final apiService = ApiService('http://13.127.81.177:8000/api/fresherjob/');
    futureJobs = apiService.fetchData();
  }
  @override
  // Widget build(BuildContext context) {
  //   final screenWidth = MediaQuery.of(context).size.width;
  //   final screenHeight = MediaQuery.of(context).size.height;
  //
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text(
  //         'Fresher Jobs',
  //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //       ),
  //       centerTitle: true,
  //       actions: [
  //         IconButton(
  //             onPressed: () {
  //               Navigator.of(context).push(
  //                   MaterialPageRoute(builder: (ctx) => const NotificationScreen()));
  //             },
  //             icon: const Icon(Icons.notifications))
  //       ],
  //     ),
  //     body: SingleChildScrollView(
  //       child: Padding(
  //         padding: EdgeInsets.all(screenWidth * 0.04), // 4% of screen width
  //         child: Center(
  //           child: Column(
  //             children: [
  //               Container(
  //                 width: screenWidth * 0.95, // 95% of screen width
  //                 height: screenHeight * 0.1, // 10% of screen height
  //                 decoration: BoxDecoration(
  //                     gradient: const LinearGradient(
  //                       colors: [Color(0xFFFC3E41), Color(0xFFFF6E01)],
  //                       begin: Alignment.topLeft,
  //                       end: Alignment.bottomRight,
  //                     ),
  //                     borderRadius: BorderRadius.circular(8)),
  //                 child: Row(
  //                   children: [
  //                     SizedBox(
  //                       width: screenWidth * 0.04, // 4% of screen width
  //                     ),
  //                     Container(
  //                       width: screenWidth * 0.08, // 8% of screen width
  //                       height: screenWidth * 0.08, // 8% of screen width
  //                       decoration: const BoxDecoration(
  //                         shape: BoxShape.circle,
  //                         color: Colors.white,
  //                       ),
  //                       child: Icon(
  //                         Icons.work,
  //                         size: screenWidth * 0.04, // 4% of screen width
  //                         color: const Color(0xFFFF3E41),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       width: screenWidth * 0.02, // 2% of screen width
  //                     ),
  //                     Text(
  //                       'Fresher Jobs',
  //                       style: TextStyle(
  //                           fontSize: screenWidth * 0.045, // 4.5% of screen width
  //                           color: Colors.white),
  //                     ),
  //                     const Spacer(),
  //                     Container(
  //                       width: screenWidth * 0.23, // 23% of screen width
  //                       height: screenWidth * 0.23, // 23% of screen width
  //                       decoration: BoxDecoration(
  //                         color: Colors.red[100],
  //                         shape: BoxShape.circle,
  //                       ),
  //                       child: Icon(
  //                         Icons.work,
  //                         color: const Color(0xFFFF3E41),
  //                         size: screenWidth * 0.1, // 10% of screen width
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: screenHeight * 0.03, // 3% of screen height
  //               ),
  //               const Align(
  //                   alignment: Alignment.centerLeft,
  //                   child: Text(
  //                     'Available Fresher Jobs (1)',
  //                     style: TextStyle(
  //                         fontSize: 16, fontWeight: FontWeight.bold),
  //                     textAlign: TextAlign.left,
  //                   )),
  //               SizedBox(
  //                 height: screenHeight * 0.03, // 3% of screen height
  //               ),
  //               // OpportunityCard(
  //               //   dp: Image.asset('assets/Rectangle 57.png'),
  //               //   role: 'Human Resource Intern',
  //               //   company: 'Hiremi',
  //               //   location: 'Bhopal, Madhya Pradesh, India',
  //               //   stipend: '2,000-15,000',
  //               //   mode: 'Remote',
  //               //   type: 'Internship',
  //               //   exp: 1,
  //               //   daysPosted: 6,
  //               // ),
  //               // SizedBox(
  //               //   height: screenHeight * 0.01, // 1% of screen height
  //               // ),
  //               // OpportunityCard(
  //               //   dp: Image.asset('images/crtd1 1.png'),
  //               //   role: 'Full Time Recruiter',
  //               //   company: 'CRTD Technologies',
  //               //   location: 'Bhopal, Madhya Pradesh, India',
  //               //   stipend: '2,000-15,000',
  //               //   mode: 'Remote',
  //               //   type: 'Job',
  //               //   exp: 1,
  //               //   daysPosted: 6,
  //               //   isVerified: isVerified,
  //               // ),
  //               SizedBox(
  //                 height: screenHeight * 0.03, // 3% of screen height
  //               ),
  //               const Align(
  //                   alignment: Alignment.centerLeft,
  //                   child: Text(
  //                     'Upcoming Fresher Jobs (1)',
  //                     style: TextStyle(
  //                         fontSize: 16, fontWeight: FontWeight.bold),
  //                     textAlign: TextAlign.left,
  //                   )),
  //               SizedBox(
  //                 height: screenHeight * 0.03, // 3% of screen height
  //               ),
  //               // OpportunityCard(
  //               //   dp: Image.asset('images/Rectangle 57.png'),
  //               //   role: 'Full Stack Developer',
  //               //   company: 'Hiremi',
  //               //   location: 'Bhopal, Madhya Pradesh, India',
  //               //   stipend: '2,000-15,000',
  //               //   mode: 'Remote',
  //               //   type: 'Job',
  //               //   exp: 1,
  //               //   daysPosted: 6,
  //               //   isVerified: isVerified,
  //               // ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fresher Jobs',
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
        future: futureJobs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No jobs available'));
          } else {
            final jobs = snapshot.data!;
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
                            borderRadius: BorderRadius.circular(8)),
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
                              'Fresher Jobs',
                              style: TextStyle(
                                  fontSize: screenWidth * 0.045, // 4.5% of screen width
                                  color: Colors.white),
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
                            'Available Fresher Jobs',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          )),
                      SizedBox(
                        height: screenHeight * 0.03, // 3% of screen height
                      ),
                      Column(
                        children: jobs.map((job) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                            child: OpportunityCard(
                                id: job['id'],
                                dp: Image.asset('images/icons/logo1.png'), // Placeholder image
                                profile: job['profile'] ?? 'N/A',
                                companyName: job['company_name'] ?? 'N/A',
                                location: job['location'] ?? 'N/A',
                                stipend: job['CTC']?.toString() ?? 'N/A',
                                mode: 'Remote', // Replace with actual data if available
                                type: 'Job', // Replace with actual data if available
                                exp: 1, // Replace with actual data if available
                                daysPosted: 0, // Replace with actual data if available
                                isVerified: widget.isVerified,
                                ctc: job['CTC']?.toString() ?? '0', // Example, replace with actual field
                                description: job['description'] ?? 'No description available',
                                education: job['education'],
                                skillsRequired: job['skills_required'],
                                whoCanApply: job['who_can_apply']
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: screenHeight * 0.35, // 35% of screen height
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