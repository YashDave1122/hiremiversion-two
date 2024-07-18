import 'package:flutter/material.dart';

import '../../../../Utils/AppSizes.dart';
import '../../../../Utils/colors.dart';


class SkillRequiredFresher extends StatelessWidget {
  const SkillRequiredFresher({Key? key, required this.skillsRequired}) : super(key: key);
  final String skillsRequired;

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
