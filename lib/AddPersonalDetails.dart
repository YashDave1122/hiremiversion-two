// import 'package:flutter/material.dart';
// import 'package:hiremi_version_two/Profile_Screen.dart';
// import 'package:hiremi_version_two/Utils/AppSizes.dart';
// import 'package:hiremi_version_two/Utils/colors.dart';
// import 'package:hiremi_version_two/widgets_mustufa/AddLanguages.dart';
// import 'package:hiremi_version_two/widgets_mustufa/TextFieldWithTitle.dart';
//
// class AddPersonalDetails extends StatefulWidget {
//   const AddPersonalDetails({Key? key, }) : super(key: key);
//
//   @override
//   State<AddPersonalDetails> createState() => _AddPersonalDetailsState();
// }
//
// class _AddPersonalDetailsState extends State<AddPersonalDetails> {
//   String selectedGender = '';
//   String selectedMaritalStatus = '';
//   String differentlyAbled = '';
//   TextEditingController homeController = TextEditingController();
//   TextEditingController pinCodeController = TextEditingController();
//   TextEditingController localAddressController = TextEditingController();
//   TextEditingController permanentAddressController = TextEditingController();
//   TextEditingController dobController = TextEditingController();
//   TextEditingController categoryController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         resizeToAvoidBottomInset: false,
//         appBar:  AppBar(
//           title: const Text('Edit Profile'),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.only(
//                 top: Sizes.responsiveXl(context),
//                 right: Sizes.responsiveDefaultSpace(context),
//                 bottom: Sizes.responsiveXxl(context)*2.4,
//                 left: Sizes.responsiveDefaultSpace(context)),
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               const Text(
//                 'Personal Details',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//               ),
//               SizedBox(
//                 height: Sizes.responsiveMd(context),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       const Text(
//                         'Gender',
//                         style:
//                             TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
//                       ),
//                       Text(
//                         '*',
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w500,
//                           color: AppColors.primary,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: Sizes.responsiveXxs(context),),
//                   Row(children: [
//                     Row(
//                       children: [
//                         Radio(
//                           activeColor: Colors.blue,
//                           value: 'Male',
//                           groupValue: selectedGender,
//                           onChanged: (value) => setState(() {
//                             selectedGender = value as String;
//                           }),
//                         ),
//                         Text(
//                           'Male',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 11,
//                               color: selectedGender == 'Male'
//                                   ? Colors.black
//                                   : AppColors.secondaryText),
//                         )
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Radio(
//                           activeColor: Colors.blue,
//                           value: 'Female',
//                           groupValue: selectedGender,
//                           onChanged: (value) => setState(() {
//                             selectedGender = value as String;
//                           }),
//                         ),
//                         Text(
//                           'Female',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 11,
//                               color: selectedGender == 'Female'
//                                   ? Colors.black
//                                   : AppColors.secondaryText),
//                         )
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Radio(
//                           activeColor: Colors.blue,
//                           value: 'Other',
//                           groupValue: selectedGender,
//                           onChanged: (value) => setState(() {
//                             selectedGender = value as String;
//                           }),
//                         ),
//                         Text(
//                           'Other',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 11,
//                               color: selectedGender == 'Other'
//                                   ? Colors.black
//                                   : AppColors.secondaryText),
//                         )
//                       ],
//                     ),
//                   ]),
//                 ],
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Marital Status',
//                     style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
//                   ),
//                   SizedBox(height: Sizes.responsiveXxs(context),),
//                   Row(children: [
//                     Row(
//                       children: [
//                         Radio(
//                           activeColor: Colors.blue,
//                           value: 'Single / Unmarried',
//                           groupValue: selectedMaritalStatus,
//                           onChanged: (value) => setState(() {
//                             selectedMaritalStatus = value as String;
//                           }),
//                         ),
//                         Text(
//                           'Single / Unmarried',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 11,
//                               color: selectedMaritalStatus == 'Single / Unmarried'
//                                   ? Colors.black
//                                   : AppColors.secondaryText),
//                         )
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Radio(
//                           activeColor: Colors.blue,
//                           value: 'Married',
//                           groupValue: selectedMaritalStatus,
//                           onChanged: (value) => setState(() {
//                             selectedMaritalStatus = value as String;
//                           }),
//                         ),
//                         Text(
//                           'Married',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 11,
//                               color: selectedMaritalStatus == 'Married'
//                                   ? Colors.black
//                                   : AppColors.secondaryText),
//                         )
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Radio(
//                           activeColor: Colors.blue,
//                           value: 'Other',
//                           groupValue: selectedMaritalStatus,
//                           onChanged: (value) => setState(() {
//                             selectedMaritalStatus = value as String;
//                           }),
//                         ),
//                         Text(
//                           'Other',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 11,
//                               color: selectedMaritalStatus == 'Other'
//                                   ? Colors.black
//                                   : AppColors.secondaryText),
//                         )
//                       ],
//                     ),
//                   ]),
//                 ],
//               ),
//                   Row(
//                     children: [
//                       Expanded(child:
//                       TextFieldWithTitle(controller: homeController, title: 'Hometown', hintText: 'eg: Bhopal')
//                       ),
//                       SizedBox(width: Sizes.responsiveMd(context),),
//                       Expanded(child:
//                       TextFieldWithTitle(controller: pinCodeController, title: 'Pincode', hintText: 'eg: 462023')
//                       )
//                     ],
//                   ),
//                   SizedBox(height: Sizes.responsiveMd(context),),
//                   TextFieldWithTitle(controller: localAddressController, title: 'Local Address', hintText: 'eg: House Number, Colony Name etc.'),
//                   SizedBox(height: Sizes.responsiveMd(context),),
//                   TextFieldWithTitle(controller: permanentAddressController, title: 'Permanent Address', hintText: 'eg: House Number, Colony Name etc.'),
//                   SizedBox(height: Sizes.responsiveMd(context),),
//                   TextFieldWithTitle(
//                       title: 'Date of Birth (DOB)',
//                       hintText: 'DD/MM/YYYY',
//                       controller: dobController,
//                       spaceBtwTextField: Sizes.responsiveMd(context),
//                       prefix: Icon(
//                         Icons.calendar_month_sharp,
//                         size: 16,
//                         color: AppColors.secondaryText,
//                       )),
//                   SizedBox(height: Sizes.responsiveMd(context),),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Are you differently abled?*',
//                             style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
//                           ),
//                           Text(
//                             '*',
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w500,
//                               color: AppColors.primary,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Row(
//                             children: [
//                               Radio(
//                                 activeColor: Colors.blue,
//                                 value: 'Yes',
//                                 groupValue: differentlyAbled,
//                                 onChanged: (value) => setState(() {
//                                   differentlyAbled = value as String;
//                                 }),
//                               ),
//                               Text(
//                                 'Yes',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 11,
//                                     color: differentlyAbled == 'Yes'
//                                         ? Colors.black
//                                         : AppColors.secondaryText),
//                               )
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Radio(
//                                 activeColor: Colors.blue,
//                                 value: 'No',
//                                 groupValue: differentlyAbled,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     differentlyAbled = value as String;
//                                   });
//                                 },
//                               ),
//                               Text(
//                                 'No',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 11,
//                                     color: differentlyAbled == 'No'
//                                         ? Colors.black
//                                         : AppColors.secondaryText),
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   TextFieldWithTitle(controller: categoryController, title: 'Category (Optional)', hintText: 'eg: General, OBC etc.'),
//                   SizedBox(height: Sizes.responsiveMd(context)* 2,),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: AppColors.primary,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(Sizes.radiusSm)),
//                             padding: EdgeInsets.symmetric(
//                                 vertical: Sizes.responsiveHorizontalSpace(context),
//                                 horizontal: Sizes.responsiveMdSm(context)),
//                           ),
//                           onPressed: () {
//                             if (selectedGender.isNotEmpty && selectedMaritalStatus.isNotEmpty && homeController.text.isNotEmpty && pinCodeController.text.isNotEmpty && localAddressController.text.isNotEmpty && permanentAddressController.text.isNotEmpty &&differentlyAbled.isNotEmpty && dobController.text.isNotEmpty && categoryController.text.isNotEmpty) {
//                               Navigator.of(context).push(MaterialPageRoute(
//                                   builder: (ctx) =>  ProfileScreen()));
//                             }
//                           },
//                           child: const Text(
//                             'Save',
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w500,
//                               color: AppColors.white,
//                             ),
//                           )),
//                       OutlinedButton(
//                           style: OutlinedButton.styleFrom(
//                             side:   BorderSide(color: AppColors.primary,width: 0.5),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(Sizes.radiusSm)),
//                             padding: EdgeInsets.symmetric(
//                                 vertical: Sizes.responsiveSm(context),
//                                 horizontal: Sizes.responsiveMdSm(context)),
//                           ),
//                           onPressed: () {
//                             if (selectedGender.isNotEmpty && selectedMaritalStatus.isNotEmpty && homeController.text.isNotEmpty && pinCodeController.text.isNotEmpty && localAddressController.text.isNotEmpty && permanentAddressController.text.isNotEmpty &&differentlyAbled.isNotEmpty && dobController.text.isNotEmpty && categoryController.text.isNotEmpty) {
//                               Navigator.of(context).push(MaterialPageRoute(
//                                   builder: (ctx) =>  const AddLanguages()));
//                             }
//                           },
//                           child:  Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Text(
//                                 'Save & Next',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w500,
//                                   color: AppColors.primary,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: Sizes.responsiveXs(context),
//                               ),
//                               Icon(
//                                 Icons.arrow_forward_ios_sharp,
//                                 size: 11,
//                                 color: AppColors.primary,
//                               )
//                             ],
//                           )),
//                     ],
//                   )
//                 ]),
//
//           ),
//         ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Profile_Screen.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:hiremi_version_two/widgets_mustufa/AddLanguages.dart';
import 'package:hiremi_version_two/widgets_mustufa/TextFieldWithTitle.dart';
import 'package:intl/intl.dart'; // Import intl package for date formatting
import 'package:shared_preferences/shared_preferences.dart';

import 'API_Integration/Add Personal Details/apiServices.dart';


class AddPersonalDetails extends StatefulWidget {
  const AddPersonalDetails({Key? key}) : super(key: key);

  @override
  State<AddPersonalDetails> createState() => _AddPersonalDetailsState();
}

class _AddPersonalDetailsState extends State<AddPersonalDetails> {
  String selectedGender = '';
  String selectedMaritalStatus = '';
  String differentlyAbled = '';
  TextEditingController homeController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController localAddressController = TextEditingController();
  TextEditingController permanentAddressController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  final AddPersonalDetailsService _apiService = AddPersonalDetailsService();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        dobController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _savePersonalDetails() async {
    if (dobController.text.isNotEmpty &&
        selectedGender.isNotEmpty &&
        nationalityController.text.isNotEmpty) {

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? profileId = prefs.getString('profileId');
      print('Profile ID: $profileId');

      if (profileId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile ID not found')),
        );
        return;
      }

      final details = {
        "date_of_birth": dobController.text,
        "gender": selectedGender,
        "nationality": nationalityController.text,
        "profile": profileId,
      };
      print(details);

      final success = await _apiService.addPersonalDetails(details);

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Personal details added successfully')),
        );
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => ProfileScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add personal details')),
        );
      }
    }
  }

  Future<void> _saveAndNext() async {
    if (dobController.text.isNotEmpty &&
        selectedGender.isNotEmpty &&
        nationalityController.text.isNotEmpty) {

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? profileId = prefs.getString('profileId');
      print('Profile ID: $profileId');

      if (profileId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile ID not found')),
        );
        return;
      }

      final details = {
        "date_of_birth": dobController.text,
        "gender": selectedGender,
        "nationality": nationalityController.text,
        "profile": profileId,
      };
      print(details);

      final success = await _apiService.addPersonalDetails(details);

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Personal details added successfully')),
        );
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => AddLanguages()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add personal details')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar:  AppBar(
          title: const Text('Edit Profile'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: Sizes.responsiveXl(context),
                right: Sizes.responsiveDefaultSpace(context),
                bottom: Sizes.responsiveXxl(context)*2.4,
                left: Sizes.responsiveDefaultSpace(context)),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Personal Details',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: Sizes.responsiveMd(context),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Gender',
                        style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
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
                  SizedBox(height: Sizes.responsiveXxs(context),),
                  Row(children: [
                    Row(
                      children: [
                        Radio(
                          activeColor: Colors.blue,
                          value: 'Male',
                          groupValue: selectedGender,
                          onChanged: (value) => setState(() {
                            selectedGender = value as String;
                          }),
                        ),
                        Text(
                          'Male',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                              color: selectedGender == 'Male'
                                  ? Colors.black
                                  : AppColors.secondaryText),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: Colors.blue,
                          value: 'Female',
                          groupValue: selectedGender,
                          onChanged: (value) => setState(() {
                            selectedGender = value as String;
                          }),
                        ),
                        Text(
                          'Female',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                              color: selectedGender == 'Female'
                                  ? Colors.black
                                  : AppColors.secondaryText),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: Colors.blue,
                          value: 'Other',
                          groupValue: selectedGender,
                          onChanged: (value) => setState(() {
                            selectedGender = value as String;
                          }),
                        ),
                        Text(
                          'Other',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                              color: selectedGender == 'Other'
                                  ? Colors.black
                                  : AppColors.secondaryText),
                        )
                      ],
                    ),
                  ]),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Marital Status',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: Sizes.responsiveXxs(context),),
                  Row(children: [
                    Row(
                      children: [
                        Radio(
                          activeColor: Colors.blue,
                          value: 'Single / Unmarried',
                          groupValue: selectedMaritalStatus,
                          onChanged: (value) => setState(() {
                            selectedMaritalStatus = value as String;
                          }),
                        ),
                        Text(
                          'Single / Unmarried',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                              color: selectedMaritalStatus == 'Single / Unmarried'
                                  ? Colors.black
                                  : AppColors.secondaryText),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: Colors.blue,
                          value: 'Married',
                          groupValue: selectedMaritalStatus,
                          onChanged: (value) => setState(() {
                            selectedMaritalStatus = value as String;
                          }),
                        ),
                        Text(
                          'Married',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                              color: selectedMaritalStatus == 'Married'
                                  ? Colors.black
                                  : AppColors.secondaryText),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          activeColor: Colors.blue,
                          value: 'Other',
                          groupValue: selectedMaritalStatus,
                          onChanged: (value) => setState(() {
                            selectedMaritalStatus = value as String;
                          }),
                        ),
                        Text(
                          'Other',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                              color: selectedMaritalStatus == 'Other'
                                  ? Colors.black
                                  : AppColors.secondaryText),
                        )
                      ],
                    ),
                  ]),
                ],
              ),
              TextFieldWithTitle(controller: homeController, title: 'Home Town', hintText: 'eg: New Delhi'),
              SizedBox(height: Sizes.responsiveMd(context),),
              TextFieldWithTitle(controller: pinCodeController, title: 'Pin Code', hintText: 'eg: 110067'),
              SizedBox(height: Sizes.responsiveMd(context),),
              TextFieldWithTitle(controller: localAddressController, title: 'Local Address', hintText: 'eg: House Number, Colony Name etc.'),
              SizedBox(height: Sizes.responsiveMd(context),),
              TextFieldWithTitle(controller: permanentAddressController, title: 'Permanent Address', hintText: 'eg: House Number, Colony Name etc.'),
              SizedBox(height: Sizes.responsiveMd(context),),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFieldWithTitle(
                    title: 'Date of Birth (DOB)',
                    hintText: 'YYYY-MM-DD',
                    controller: dobController,
                    spaceBtwTextField: Sizes.responsiveMd(context),
                    prefix: Icon(
                      Icons.calendar_month_sharp,
                      size: 16,
                      color: AppColors.secondaryText,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Sizes.responsiveMd(context),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Are you differently abled?',
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
                          Radio(
                            activeColor: Colors.blue,
                            value: 'Yes',
                            groupValue: differentlyAbled,
                            onChanged: (value) => setState(() {
                              differentlyAbled = value as String;
                            }),
                          ),
                          Text(
                            'Yes',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                                color: differentlyAbled == 'Yes'
                                    ? Colors.black
                                    : AppColors.secondaryText),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: Colors.blue,
                            value: 'No',
                            groupValue: differentlyAbled,
                            onChanged: (value) {
                              setState(() {
                                differentlyAbled = value as String;
                              });
                            },
                          ),
                          Text(
                            'No',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 11,
                                color: differentlyAbled == 'No'
                                    ? Colors.black
                                    : AppColors.secondaryText),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              TextFieldWithTitle(controller: categoryController, title: 'Category (Optional)', hintText: 'eg: General, OBC etc.'),
              SizedBox(height: Sizes.responsiveMd(context),),
              TextFieldWithTitle(controller: nationalityController, title: 'Nationality', hintText: 'eg: Indian'),
              SizedBox(height: Sizes.responsiveMd(context)* 2,),
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
                      onPressed: _savePersonalDetails,
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      )),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side:   BorderSide(color: AppColors.primary,width: 0.5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Sizes.radiusSm)),
                        padding: EdgeInsets.symmetric(
                            vertical: Sizes.responsiveSm(context),
                            horizontal: Sizes.responsiveMdSm(context)),
                      ),
                      onPressed: _saveAndNext,
                      child:  Row(
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
                      )),
                ],
              )
            ]),

          ),
        ));
  }
}
