
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hiremi_version_two/API_Integration/Internship/Apiservices.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:ui'; // For BackdropFilter
import 'package:hiremi_version_two/Custom_Widget/OppurtunityCard.dart';
import 'package:hiremi_version_two/Custom_Widget/Verifiedtrue.dart';
import 'package:hiremi_version_two/Custom_Widget/banners.dart';
import 'package:hiremi_version_two/Custom_Widget/drawer_child.dart';
import 'package:hiremi_version_two/Custom_Widget/verification_status.dart';
import 'package:hiremi_version_two/InternshipScreen.dart';
import 'package:hiremi_version_two/Notofication_screen.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:hiremi_version_two/bottomnavigationbar.dart';
import 'package:hiremi_version_two/experienced_jobs.dart';
import 'package:hiremi_version_two/fresherJobs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  final bool isVerified;
  const HomePage({Key? key, required this.isVerified}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  int _selectedIndex = 0;
  double _blurAmount = 10.0;
  List<dynamic> _jobs = [];
  bool _isLoading = true;
  String FullName = "";
  String storedEmail = '';
  String UID="";

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _fetchJobs();
    print(widget.isVerified);
    fetchAndSaveFullName();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    double offset = _scrollController.offset;
    setState(() {
      _blurAmount = (10 - (offset / 10)).clamp(0, 10);
    });
  }

  Future<void> _fetchJobs() async {
    try {
      final apiService = ApiService('http://13.127.81.177:8000/api/internship/');
      final data = await apiService.fetchData();
      setState(() {
        _jobs = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> fetchAndSaveFullName() async {
    const String apiUrl = "http://13.127.81.177:8000/api/registers/";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final prefs = await SharedPreferences.getInstance();
        storedEmail = prefs.getString('email') ?? 'No email saved';

        for (var user in data) {
          if (user['email'] == storedEmail) {
            setState(() {
              FullName = user['full_name'] ?? 'No name saved';
              UID=user['unique'];

            });
            await prefs.setString('full_name', FullName);
            print('Full name saved: $FullName');
            break;
          }
        }

        if (FullName.isEmpty) {
          print('No matching email found');
        }
      } else {
        print('Failed to fetch full name');
      }
    } catch (e) {
      print('Error: $e');
    }
  }



  final List<String> bannerImages = [
    'images/icons/Hiremi Banner.png',
    'images/icons/Hiremi Banner2.png',
    'images/icons/Hiremi Banner3.png',
    'images/icons/Hiremi Banner4.png',
    'images/icons/Hiremi Banner5.png'
  ];
  final List<String> verifiedBannerImages = [
    'images/icons/Hiremi Verified Banner.png',
    'images/icons/Hiremi Verified Banner2.png',
    'images/icons/Hiremi Verified Banner3.png',
    'images/icons/Hiremi Verified Banner4.png',
    'images/icons/Hiremi Verified Banner5.png'
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Hiremi's Home",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => const NotificationScreen(),
              ));
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      drawer:  Drawer(
        backgroundColor: Colors.white,
        child: DrawerChild(isVerified: widget.isVerified,),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!widget.isVerified) VerificationStatus(percent: 0.5),
              if (widget.isVerified) VerifiedProfileWidget(name: FullName, appId: UID),
              SizedBox(height: screenHeight * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Explore hiremi',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Column(
                    children: [

                      SizedBox(
                        width: screenWidth * 0.98,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: screenHeight*0.139,
                            viewportFraction: 1.25,
                            autoPlay: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            },
                          ),
                          items: (widget.isVerified ? verifiedBannerImages : bannerImages).map((image) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Image.asset(image, fit: BoxFit.cover);
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [1, 2, 3, 4, 5].asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                    Brightness.dark
                                    ? Colors.white
                                    : AppColors.primary)
                                    .withOpacity(
                                    _current == entry.key ? 0.9 : 0.4),
                              ),
                            ),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              const Text(
                "Hiremi's Featured",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF6E01), Color(0xFFFEBC0D)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => InternshipsScreen(isVerified: widget.isVerified)));

                                              },
                      child: Row(
                        children: [
                          Container(
                            width: screenWidth * 0.05,
                            height: screenWidth * 0.05,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.spa,
                              size: screenWidth * 0.02,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.015),
                          Text(
                            'Internships',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.025,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFC3E41), Color(0xFFFF6E01)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => FresherJobs(isVerified: widget.isVerified)));
                      },
                      child: Row(
                        children: [
                          Container(
                            width: screenWidth * 0.05,
                            height: screenWidth * 0.05,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.work,
                              size: screenWidth * 0.02,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.015),
                          Text(
                            'Fresher Jobs',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.025,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFCB44BD), Color(0xFFDB6AA0)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>  ExperiencedJobs(isVerified: widget.isVerified)));
                      },
                      child: Row(
                        children: [
                          Container(
                            width: screenWidth * 0.05,
                            height: screenWidth * 0.05,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.work,
                              size: screenWidth * 0.02,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.015),
                          Text(
                            'Experienced Jobs',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.025,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              const Text(
                'Latest Opportunities',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: screenHeight * 0.01),
              Column(
                children: _jobs.map((job) {
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
                      type: 'Job', // Replace with actual data if available
                      exp: 1, // Replace with actual data if available
                      daysPosted: 0, // Replace with actual data if available
                      isVerified: widget.isVerified,
                      ctc: job['Stipend']?.toString() ?? '0', // Example, replace with actual field
                      description: job['description'] ?? 'No description available',
                      education: job['education'],
                      skillsRequired: job['skills_required'],
                      whoCanApply: job['who_can_apply'], isApplied: false,
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }
}
