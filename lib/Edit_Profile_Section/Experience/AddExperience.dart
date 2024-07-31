import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import '../../API_Integration/Add Experience/apiServices.dart';
import '../widgets/CustomTextField.dart';
import 'package:intl/intl.dart';

class AddExperience extends StatefulWidget {
  const AddExperience({Key? key}) : super(key: key);

  @override
  State<AddExperience> createState() => _AddExperienceState();
}

class _AddExperienceState extends State<AddExperience> {
  String experience = '';
  String environment = '';
  String currentCompany = '';
  final organizationController = TextEditingController();
  final jobTitleController = TextEditingController();
  final skillSetController = TextEditingController();
  final joiningDateController = TextEditingController();
  final AddExperienceService _apiService = AddExperienceService();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        joiningDateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  Future<void> _saveExperience() async {
    if (organizationController.text.isNotEmpty &&
        jobTitleController.text.isNotEmpty &&
        joiningDateController.text.isNotEmpty &&
        experience.isNotEmpty &&
        environment.isNotEmpty &&
        currentCompany.isNotEmpty) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? profileId = prefs.getInt('profileId')?.toString();
      print('Profile ID: $profileId');

      if (profileId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile ID not found')),
        );
        return;
      }

      final details = {
        "work_experience": experience,
        "work_environment": environment,
        "company_name": organizationController.text,
        "job_title": jobTitleController.text,
        "skill_used": skillSetController.text.isEmpty ? null : skillSetController.text,
        "start_date": joiningDateController.text,
        "current_company": currentCompany,
        "end_date": null,
        "profile": profileId,
      };
      print(details);

      final success = await _apiService.addExperience(details);

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Experience details added successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add experience details')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all required fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: Sizes.responsiveXl(context),
          right: Sizes.responsiveDefaultSpace(context),
          bottom: kToolbarHeight,
          left: Sizes.responsiveDefaultSpace(context),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Experience',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: Sizes.responsiveMd(context),
          ),
          Row(
            children: [
              const Text(
                'Do you have work experience?',
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
          Row(
            children: [
              Row(
                children: [
                  Radio<String>(
                    activeColor: Colors.blue,
                    value: 'YES',
                    groupValue: experience,
                    onChanged: (value) => setState(() {
                      experience = value!;
                    }),
                  ),
                  Text(
                    'Yes',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      color: experience == 'YES'
                          ? Colors.black
                          : AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                    activeColor: Colors.blue,
                    value: 'NO',
                    groupValue: experience,
                    onChanged: (value) {
                      setState(() {
                        experience = value!;
                      });
                    },
                  ),
                  Text(
                    'No',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      color: experience == 'NO'
                          ? Colors.black
                          : AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What type of work environment do you prefer?',
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
          Row(
            children: [
              Row(
                children: [
                  Radio<String>(
                    activeColor: Colors.blue,
                    value: 'On-Site',
                    groupValue: environment,
                    onChanged: (value) => setState(() {
                      environment = value!;
                    }),
                  ),
                  Text(
                    'On-Site',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                      color: environment == 'On-Site'
                          ? Colors.black
                          : AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                    activeColor: Colors.blue,
                    value: 'Hybrid',
                    groupValue: environment,
                    onChanged: (value) {
                      setState(() {
                        environment = value!;
                      });
                    },
                  ),
                  Text(
                    'Hybrid',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                      color: environment == 'Hybrid'
                          ? Colors.black
                          : AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                    activeColor: Colors.blue,
                    value: 'Remote',
                    groupValue: environment,
                    onChanged: (value) {
                      setState(() {
                        environment = value!;
                      });
                    },
                  ),
                  Text(
                    'Remote',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                      color: environment == 'Remote'
                          ? Colors.black
                          : AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'Is this your current company?',
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
          Row(
            children: [
              Row(
                children: [
                  Radio<String>(
                    activeColor: Colors.blue,
                    value: 'YES',
                    groupValue: currentCompany,
                    onChanged: (value) => setState(() {
                      currentCompany = value!;
                    }),
                  ),
                  Text(
                    'Yes',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      color: currentCompany == 'YES'
                          ? Colors.black
                          : AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                    activeColor: Colors.blue,
                    value: 'NO',
                    groupValue: currentCompany,
                    onChanged: (value) {
                      setState(() {
                        currentCompany = value!;
                      });
                    },
                  ),
                  Text(
                    'No',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      color: currentCompany == 'NO'
                          ? Colors.black
                          : AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      const Text(
                        'Organization Name',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '*',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                    ]),
                    CustomTextField(
                      controller: organizationController,
                      hintText: '',
                    ),
                  ],
                ),
              ),
              SizedBox(width: Sizes.responsiveSm(context)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      const Text(
                        'Job Title',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '*',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                    ]),
                    CustomTextField(
                      controller: jobTitleController,
                      hintText: '',
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                const Text(
                  'Skill Set Used',
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
              ]),
              CustomTextField(
                controller: skillSetController,
                hintText: '',
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                const Text(
                  'Joining Date',
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
              ]),
              SizedBox(
                height: Sizes.responsiveSm(context),
              ),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.radiusXs),
                      border: Border.all(width: 0.37, color: AppColors.black),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.calendar_today,
                            size: 14,
                            color: AppColors.secondaryText,
                          ),
                        ),
                        const VerticalDivider(
                          thickness: 1.0,
                          width: 0.37,
                          color: AppColors.black,
                        ),
                        Expanded(
                          child: TextField(
                            controller: joiningDateController,
                            cursorColor: AppColors.black,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              hintText: 'YYYY-MM-DD',
                              suffixIconColor: AppColors.secondaryText,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: Sizes.responsiveSm(context),
                                horizontal: Sizes.responsiveMd(context),
                              ),
                              alignLabelWithHint: true,
                              hintStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.secondaryText,
                              ),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: Sizes.responsiveMd(context)),
          ElevatedButton(
            onPressed: _saveExperience,
            child: Text('Save Experience'),
          ),
        ]),
      ),
    );
  }
}
