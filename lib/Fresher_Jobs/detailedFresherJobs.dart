// import 'package:flutter/material.dart';
// import 'package:hiremi_version_two/Fresher_Jobs/eligibilityCriteria.dart';
// import 'package:hiremi_version_two/Fresher_Jobs/HeaderSectionFresher.dart';
// import 'package:hiremi_version_two/Notofication_screen.dart';
// import 'package:hiremi_version_two/Fresher_Jobs/roleDetails.dart';
// import 'package:hiremi_version_two/Fresher_Jobs/skillsRequired.dart';
// import 'package:hiremi_version_two/Utils/AppSizes.dart';
//
// class DetailedFresherJobs extends StatefulWidget {
//   final int id;
//   final String profile;
//   final String location;
//   final String codeRequired;
//   final int code;
//   final String companyName;
//   final String education;
//   final String skillsRequired;
//   final String? knowledgeStars;
//   final String whoCanApply;
//   final String description;
//   final String termsAndConditions;
//   final double ctc;
//
//   const DetailedFresherJobs({
//     Key? key,
//     required this.id,
//     required this.profile,
//     required this.location,
//     required this.codeRequired,
//     required this.code,
//     required this.companyName,
//     required this.education,
//     required this.skillsRequired,
//     this.knowledgeStars,
//     required this.whoCanApply,
//     required this.description,
//     required this.termsAndConditions,
//     required this.ctc,
//   }) : super(key: key);
//
//   @override
//   State<DetailedFresherJobs> createState() => _DetailedFresherJobsState();
// }
//
// class _DetailedFresherJobsState extends State<DetailedFresherJobs> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Fresher Jobs'),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.of(context).push(
//                   MaterialPageRoute(builder: (ctx) => const NotificationScreen()));
//             },
//             icon: const Icon(Icons.notifications),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(
//             top: Sizes.responsiveXl(context),
//             right: Sizes.responsiveDefaultSpace(context),
//             bottom: kToolbarHeight * 1.5,
//             left: Sizes.responsiveDefaultSpace(context),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// Header Sections
//               HeaderSectionFresher(
//                 profile: widget.profile,
//                 companyName: widget.companyName,
//                 location: widget.location,
//                 ctc: widget.ctc,
//               ),
//               SizedBox(height: Sizes.responsiveXl(context)),
//
//               /// Role Details
//               RoleDetailsFresher(
//                 profile: widget.profile,
//                 location: widget.location,
//                 ctc: widget.ctc,
//                 description: widget.description,
//               ),
//               SizedBox(
//                 height: Sizes.responsiveLg(context),
//               ),
//
//               /// Skill Required
//               SkillRequiredFresher(
//                 skillsRequired: widget.skillsRequired,
//               ),
//               SizedBox(
//                 height: Sizes.responsiveLg(context),
//               ),
//
//               /// Eligibility Criteria
//               EligibilityCriteriaAboutCompanyFresher(
//                 education: widget.education,
//                 whoCanApply: widget.whoCanApply,
//                 companyName: widget.companyName,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Eligibility_Criteria_About_Company.dart';
import 'package:hiremi_version_two/Fresher_Jobs/HeaderSectionFresher.dart';
import 'package:hiremi_version_two/Fresher_Jobs/roleDetails.dart';
import 'package:hiremi_version_two/Fresher_Jobs/skillsRequired.dart';

import 'package:hiremi_version_two/Notofication_screen.dart';
import 'package:hiremi_version_two/SuccesfullyAppliedalert.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';



class DetailedFresherJobs extends StatefulWidget {
  final int id;
  final String profile;
  final String location;
  final String codeRequired;
  final int code;
  final String companyName;
  final String education;
  final String skillsRequired;
  final String? knowledgeStars;
  final String whoCanApply;
  final String description;
  final String termsAndConditions;
  final double ctc;

  const DetailedFresherJobs({
    Key? key,
    required this.id,
    required this.profile,
    required this.location,
    required this.codeRequired,
    required this.code,
    required this.companyName,
    required this.education,
    required this.skillsRequired,
    this.knowledgeStars,
    required this.whoCanApply,
    required this.description,
    required this.termsAndConditions,
    required this.ctc,
  });

  @override
  State<DetailedFresherJobs> createState() => _DetailedFresherJobsState();
}

class _DetailedFresherJobsState extends State<DetailedFresherJobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        // title: const Text('Fresher Jobs', style:  TextStyle(
        //     fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const NotificationScreen()));
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: Sizes.responsiveXl(context),
            right: Sizes.responsiveDefaultSpace(context),
            bottom: kToolbarHeight * 1.5,
            left: Sizes.responsiveDefaultSpace(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header Sections
              HeaderSectionFresher(
                profile: widget.profile,
                companyName: widget.companyName,
                location: widget.location,
                ctc: widget.ctc,
                onTap:  ()=>showDialog(
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
                ),
              ),

              SizedBox(height: Sizes.responsiveXl(context)),

              /// Role Details
              RoleDetailsFresher(
                profile: widget.profile,
                location: widget.location,
                ctc: widget.ctc,
                description: widget.description,
              ),
              SizedBox(
                height: Sizes.responsiveLg(context),
              ),
              /// Skill Required
              SkillRequiredFresher(
                skillsRequired: widget.skillsRequired,
              ),
              SizedBox(
                height: Sizes.responsiveLg(context),
              ),

              /// Eligibility Criteria
              EligibilityCriteriaAboutCompanyFresher(

              ),
            ],
          ),
        ),
      ),
    );
  }
}
