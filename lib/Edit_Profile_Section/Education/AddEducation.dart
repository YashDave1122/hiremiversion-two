import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hiremi_version_two/Edit_Profile_Section/Experience/AddExperience.dart';
import 'package:hiremi_version_two/Edit_Profile_Section/widgets/CustomTextField.dart';
import 'package:hiremi_version_two/Profile_Screen.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';

import '../../API_Integration/Add Education/apiServices.dart';


class AddEducation extends StatelessWidget {
  AddEducation({Key? key}) : super(key: key);

  final educationController = TextEditingController();
  final courseController = TextEditingController();
  final yearController = TextEditingController();
  final marksController = TextEditingController();
  final AddEducationService _apiService = AddEducationService();
  String profileId="";

  Future<void> _saveEducation(BuildContext context) async {
    if (educationController.text.isNotEmpty &&
        courseController.text.isNotEmpty &&
        yearController.text.isNotEmpty &&
        marksController.text.isNotEmpty) {
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // final String? profileId = prefs.getString('profileId');
      // print('Profile ID: $profileId');
      final prefs = await SharedPreferences.getInstance();
      final int? savedId = prefs.getInt('userId');
      if (savedId != null) {
        print("Retrieved id is $savedId");
        profileId=savedId.toString();
      } else {
        print("No id found in SharedPreferences");
      }

      if (profileId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile ID not found')),
        );
        return;
      }

      final details = {
        "degree": educationController.text,
        "institution": courseController.text,
        "passing_year": yearController.text,
        //"marks": marksController.text,
        "profile": profileId,
      };
      print(details);

      final success = await _apiService.addEducation(details);

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Education details added successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add education details')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: Sizes.responsiveXl(context),
              right: Sizes.responsiveDefaultSpace(context),
              bottom: kToolbarHeight,
              left: Sizes.responsiveDefaultSpace(context)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Education',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: Sizes.responsiveMd(context),
            ),
            Row(
              children: [
                const Text(
                  'Education',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Sizes.responsiveSm(context),
            ),
            CustomTextField(
              controller: educationController,
              hintText: 'Select Education Level',
              suffix: const Icon(
                Icons.arrow_drop_down,
                color: AppColors.black,
                size: 15,
              ),
            ),
            SizedBox(
              height: Sizes.responsiveMd(context),
            ),
            Row(
              children: [
                const Text(
                  'Subject/Course',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Sizes.responsiveSm(context),
            ),
            CustomTextField(
              controller: courseController,
              hintText: 'Select Subject or Course Level',
              suffix: const Icon(
                Icons.arrow_drop_down,
                color: AppColors.black,
                size: 15,
              ),
            ),
            SizedBox(
              height: Sizes.responsiveMd(context),
            ),
            Row(
              children: [
                const Text(
                  'Passing Out Year',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Sizes.responsiveSm(context),
            ),
            CustomTextField(
              controller: yearController,
              hintText: 'eg: 2024',
              suffix: const Icon(
                Icons.arrow_drop_down,
                color: AppColors.black,
                size: 15,
              ),
            ),
            SizedBox(
              height: Sizes.responsiveMd(context),
            ),
            Row(
              children: [
                const Text(
                  'Marks/Percentage/Grade/CGPA',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Sizes.responsiveSm(context),
            ),
            CustomTextField(
              controller: marksController,
              hintText: 'eg: 84.99%',
            ),
            SizedBox(
              height: Sizes.responsiveMd(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Sizes.radiusSm)),
                    padding: EdgeInsets.symmetric(
                        vertical: Sizes.responsiveHorizontalSpace(context),
                        horizontal: Sizes.responsiveMdSm(context)),
                  ),
                  onPressed: () async {
                    await _saveEducation(context);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ProfileScreen()));
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.primary, width: 0.5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Sizes.radiusSm)),
                    padding: EdgeInsets.symmetric(
                        vertical: Sizes.responsiveSm(context),
                        horizontal: Sizes.responsiveMdSm(context)),
                  ),
                  onPressed: () async {
                    await _saveEducation(context);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AddExperience()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Save & Next',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(
                        width: Sizes.responsiveXs(context),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 11,
                        color: AppColors.primary,
                      )
                    ],
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
