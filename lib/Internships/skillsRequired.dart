import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/roundedContainer.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';


class SkillRequiredInternship extends StatelessWidget {
  final String skillsRequired;

  const SkillRequiredInternship({
    Key? key,
    required this.skillsRequired,
  }) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         'Skills Required',
  //         style: Theme.of(context).textTheme.titleSmall,
  //       ),
  //       SizedBox(
  //         height: Sizes.responsiveSm(context),
  //       ),
  //       Text(
  //         skillsRequired,
  //         style: const TextStyle(
  //           fontSize: 8.0,
  //           fontWeight: FontWeight.w400,
  //           height: 1.5,
  //         ),
  //       ),
  //     ],
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Skill Required',
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: AppColors.primary)),
        SizedBox(
          height: Sizes.responsiveMd(context),
        ),
        Text(
          skillsRequired,
          style: const TextStyle(
            fontSize: 8.0,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

