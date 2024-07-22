import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/drawer_child.dart';
import 'package:hiremi_version_two/Notofication_screen.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:hiremi_version_two/widgets_mustufa/BasicDetails.dart';
import 'package:hiremi_version_two/widgets_mustufa/Education.dart';
import 'package:hiremi_version_two/widgets_mustufa/Experience.dart';
import 'package:hiremi_version_two/widgets_mustufa/KeySkills.dart';
import 'package:hiremi_version_two/widgets_mustufa/Languages.dart';
import 'package:hiremi_version_two/widgets_mustufa/PersonalInfo.dart';
import 'package:hiremi_version_two/widgets_mustufa/PersonalLinks.dart';
import 'package:hiremi_version_two/widgets_mustufa/ProfileStatusSection.dart';
import 'package:hiremi_version_two/widgets_mustufa/ProfileSummary.dart';
import 'package:hiremi_version_two/widgets_mustufa/Projects.dart';
import 'package:hiremi_version_two/widgets_mustufa/ResumeSection.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    Key? key,
  }) : super(key: key);

  final List<String> skills = [
    'UI/UX',
    'Frontend',
    'Backend',
    'Flutter',
    'Javascript'
  ];
  final List<Map<String, String>> educationDetails = [
    {
      'course': 'B.Tech, CSE',
      'place': 'Bhopal, Madhya Pradesh',
      'duration': '2021-2025 | Percentage: 70.00%',
    },
    {
      'course': '12th, Math’s Stream',
      'place': 'Bhopal, Madhya Pradesh',
      'duration': '2021-2020 | Percentage: 84.00%',
    },
    {
      'course': '10th, All Subjects',
      'place': 'Bhopal, Madhya Pradesh',
      'duration': '2019-2018 | Percentage: 84.02%',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => NotificationScreen()));
              },
              icon: const Icon(Icons.notifications))
        ],
      ),
      // drawer:  Drawer(
      //   child: DrawerChild(isVerified: widget.isVerified,),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: Sizes.responsiveDefaultSpace(context),
              right: Sizes.responsiveDefaultSpace(context),
              top: Sizes.responsiveDefaultSpace(context),
              bottom: Sizes.responsiveXxl(context) * 2.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileStatusSection(),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              Divider(
                height: 0.25,
                thickness: 0.5,
                color: AppColors.secondaryText,
              ),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              ResumeSection(),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              const BasicDetails(
                  lookingFor: 'Internships',
                  location: 'Bhopal, Madhya Pradesh, India',
                  email: 'admin@gmail.com',
                  phoneNumber: '+9988774562',
                  messageNumber: '+9988774562'),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              const ProfileSummary(
                summary:
                    'I’m a fresher and looking for internships, I\'ve a skillset including Web Development from frontend work to backend work, Development from frontend work to backend work.',
              ),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              KeySkills(
                skills: skills,
              ),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              Education(
                education: educationDetails,
              ),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              const Experience(),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              const Projects(),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              const PersonalInfo(),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              const PersonalLinks(),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              const Languages()
            ],
          ),
        ),
      ),
    );
  }
}
