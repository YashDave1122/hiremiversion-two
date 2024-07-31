// import 'package:flutter/material.dart';
// import 'package:hiremi_version_two/Eligibility_Criteria_About_Company_internship.dart';
// import 'package:hiremi_version_two/HeaderSectionInternship.dart';
// import 'package:hiremi_version_two/Notofication_screen.dart';
// import 'package:hiremi_version_two/RoleDetailInternship.dart';
// import 'package:hiremi_version_two/SkillRequired.dart';
// import 'package:hiremi_version_two/Utils/AppSizes.dart';
// import 'package:hiremi_version_two/Utils/colors.dart';
//
//
//
// class InternshipsDetailsScreen extends StatelessWidget {
//   const InternshipsDetailsScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: AppBar(
//         title: const Text('Internship Details'),
//         centerTitle: true,
//         actions: [
//           IconButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                     MaterialPageRoute(builder: (ctx) => const NotificationScreen()));
//               },
//               icon: const Icon(Icons.notifications))
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(
//               top: Sizes.responsiveXl(context),
//               right: Sizes.responsiveDefaultSpace(context),
//               bottom: kToolbarHeight * 1.5,
//               left: Sizes.responsiveDefaultSpace(context)),
//           child:
//           Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//
//             /// Header Sections
//             const HeaderSection(),
//
//             SizedBox(height: Sizes.responsiveXl(context)),
//
//             /// Role Details
//             const RoleDetails(),
//             SizedBox(
//               height: Sizes.responsiveLg(context),
//             ),
//             /// Skill Required
//             const SkillRequired(),
//             SizedBox(
//               height: Sizes.responsiveLg(context),
//             ),
//
//             /// Eligibility Criteria
//             const EligibilityCriteriaAboutCompany()
//           ]),
//         ),
//       ),
//     );
//   }
// }
//
