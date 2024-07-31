
import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Eligibility_Criteria_About_Company.dart';
import 'package:hiremi_version_two/Fresher_Jobs/HeaderSectionFresher.dart';
import 'package:hiremi_version_two/Fresher_Jobs/roleDetails.dart';
import 'package:hiremi_version_two/Fresher_Jobs/skillsRequired.dart';

import 'package:hiremi_version_two/Notofication_screen.dart';
import 'package:hiremi_version_two/SuccesfullyAppliedalert.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:hiremi_version_two/fresherJobs.dart';

import '../API_Integration/Apply Fresher Jobs/apiServices.dart';



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
  bool _isApplied = false;

  Future<void> _applyForFresherJob() async {
    print(widget.id);

    try {
      await ApiServices.applyForJob(widget.id, context);
      // setState(() {
      //   _isApplied = true;
      // });
    } catch (error) {
      print('Error applying for fresher job: $error');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        // title: const Text('Fresher Jobs', style:  TextStyle(
        //     fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
                // onTap:  ()=>showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return AlertDialog(
                //         contentPadding: EdgeInsets.zero,
                //         backgroundColor: Colors.white,
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(20),
                //         ),
                //         content: const SuccessfullyAppliedAlert());
                //   },
                // ),
                onTap: _applyForFresherJob,
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
              // Center(
              //   child: SizedBox(
              //     width: Sizes.responsiveXxl(context) * 2.02,
              //     height: Sizes.responsiveLg(context) * 1.06,
              //     child: ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //         backgroundColor: _isApplied ? Colors.green : Color(0xFFC1272D),
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(Sizes.radiusXs),
              //         ),
              //         padding: EdgeInsets.symmetric(
              //           vertical: Sizes.responsiveHorizontalSpace(context),
              //           horizontal: Sizes.responsiveMdSm(context),
              //         ),
              //       ),
              //       onPressed: _isApplied ? null : _applyForFresherJob,
              //       child: Row(
              //         mainAxisSize: MainAxisSize.min,
              //         children: [
              //           const Text(
              //             'Apply Now',
              //             style: TextStyle(
              //               fontSize: 8.5,
              //               fontWeight: FontWeight.w500,
              //               color: AppColors.white,
              //             ),
              //           ),
              //           SizedBox(
              //             width: Sizes.responsiveXs(context),
              //           ),
              //           const Icon(
              //             Icons.arrow_forward_ios_sharp,
              //             size: 8,
              //             color: AppColors.white,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
