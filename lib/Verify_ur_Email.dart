//
// import 'package:flutter/material.dart';
// import 'package:hiremi_version_two/Apis/api.dart';
// import 'package:hiremi_version_two/api_services/user_services.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:hiremi_version_two/Create_new_password.dart';
// import 'package:hiremi_version_two/Custom_Widget/Curved_Container.dart';
// import 'package:hiremi_version_two/Custom_Widget/Elevated_Button.dart';
// import 'package:hiremi_version_two/Custom_Widget/SliderPageRoute.dart';
// import 'package:hiremi_version_two/Custom_Widget/TextFeild.dart';
//
// class VerifyUrEmail extends StatefulWidget {
//   const VerifyUrEmail({Key? key}) : super(key: key);
//
//   @override
//   State<VerifyUrEmail> createState() => _VerifyUrEmailState();
// }
//
// class _VerifyUrEmailState extends State<VerifyUrEmail> {
//   final UserService _userService = UserService();
//   TextEditingController otpController = TextEditingController();
//   bool isLoading = false;
//
//   Future<void> validateOTP(String otp) async {
//     setState(() {
//       isLoading = true;
//     });
//
//     try {
//
//       final response = await _userService.createPostApi({"otp": otp}, ApiUrls.otpValidation);
//       setState(() {
//         isLoading = false;
//       });
//
//       if (response.statusCode == 200) {
//         // Store the OTP in shared preferences (example usage)
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         await prefs.setString('otp', otp);
//         print("Hdjhf");
//         Navigator.pushReplacement(
//           context,
//           SlidePageRoute(page: CreateNewPassword()),
//         );
//       } else {
//         print(response.statusCode);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Invalid OTP. Please try again.')),
//         );
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       print(e);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('An error occurred. Please try again later.')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Container(
//             child: Column(
//               children: [
//                 Center(
//                   child: Image.asset(
//                     'images/Hiremi_new_Icon.png',
//                     width: MediaQuery.of(context).size.width * 0.6,
//                     height: MediaQuery.of(context).size.height * 0.25,
//                   ),
//                 ),
//                 Text(
//                   "Verify Your Email Address",
//                   style: TextStyle(
//                     fontSize: 21.0,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 Text(
//                   "Hey, have You Received",
//                   style: TextStyle(
//                     fontSize: 21.0,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 Center(
//                   child: Image.asset(
//                     'images/EnterOTP.png',
//                     width: MediaQuery.of(context).size.width * 0.6,
//                     height: MediaQuery.of(context).size.height * 0.32,
//                   ),
//                 ),
//                 SizedBox(height: MediaQuery.of(context).size.height * 0.0),
//                 CurvedContainer(
//                   backgroundColor: Colors.white,
//                   borderColor: Colors.black,
//                   borderWidth: 0.53,
//                   child: Column(
//                     children: [
//                       SizedBox(height: MediaQuery.of(context).size.height * 0.0215),
//
//                       SizedBox(height: MediaQuery.of(context).size.height * 0.0115),
//                       // Padding(
//                       //   padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
//                       //   child: CurvedTextField(
//                       //     controller: otpController,
//                       //     hintText: "XXXXXX",
//                       //     prefixIcon: Icons.account_circle,
//                       //     obscureText: false,
//                       //   ),
//                       // ),
//                       buildLabeledTextField(
//                         context,
//                         "Enter One-Time Password",
//                         "Enter Your OTP",
//
//                         prefixIcon: Icons.lock_outline,
//                         controller: otpController,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your Otp';
//                           }
//
//                           return null;
//                         },
//
//                         // Set to true to show the box with the prefix icon
//                       ),
//                       SizedBox(height: MediaQuery.of(context).size.height * 0.0185),
//                       RichText(
//                         textAlign: TextAlign.center,
//                         text: TextSpan(
//                           children: [
//                             TextSpan(
//                               text: "Please Enter your ",
//                               style: TextStyle(color: Colors.black),
//                             ),
//                             TextSpan(
//                               text: "six digit ",
//                               style: TextStyle(color: Colors.blue),
//                             ),
//                             TextSpan(
//                               text: "that you have received in your mailbox.",
//                               style: TextStyle(color: Colors.black),
//                             ),
//                             TextSpan(
//                               text: " ",
//                               style: TextStyle(color: Colors.black),
//                             ),
//                             WidgetSpan(
//                               child: TextButton(
//                                 onPressed: () {
//                                   print("Resend OTP clicked");
//                                 },
//                                 child: Text(
//                                   "Resend OTP",
//                                   style: TextStyle(
//                                     color: Colors.blue,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: MediaQuery.of(context).size.height * 0.0285),
//                       Center(
//                         child: isLoading
//                             ? CircularProgressIndicator()
//                             : CustomElevatedButton(
//                           width: MediaQuery.of(context).size.width * 0.775,
//                           height: MediaQuery.of(context).size.height * 0.0625,
//                           text: 'Confirm',
//                           onPressed: () async {
//                            // validateOTP(otpController.text.toString().trim());
//                             String otp = otpController.text.toString().trim();
//                             Map<String, dynamic> body = {
//                               "otp": otp,
//                             };
//                             final responce = await _userService.createPostApi(
//                                 body, ApiUrls.otpValidation);
//
//                             if (responce.statusCode == 200) {
//                               Navigator.pushReplacement(
//                                 context,
//                                 SlidePageRoute(page: CreateNewPassword()),
//                               );
//                               // ignore: use_build_context_synchronously
//                               print(responce.statusCode);
//                               print(responce.body);
//
//                             }
//                             else
//                               {
//                                 print(responce.statusCode);
//                                 print(responce.body);
//                               }
//
//                           },
//                         ),
//                       ),
//                       SizedBox(height: MediaQuery.of(context).size.height * 0.0747),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildLabeledTextField(
//       BuildContext context,
//       String label,
//       String hintText, {
//         bool showPositionedBox = false,
//         IconData? positionedIcon,
//         IconData? prefixIcon,
//         bool obscureText = false,
//         List<String>? dropdownItems,
//         TextEditingController? controller,
//         String? Function(String?)? validator,
//         VoidCallback? onTap,
//         TextInputType? keyboardType,
//         Widget? suffixIcon,
//         bool showContainer = false,
//       }) {
//     double calculatedBorderRadius = MediaQuery.of(context).size.width * 0.02;
//     double calculatedSemiCircleWidth = MediaQuery.of(context).size.width * 0.08;
//     double calculatedPaddingStart = MediaQuery.of(context).size.width * 0.1;
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
//           child: RichText(
//             text: TextSpan(
//               children: [
//                 TextSpan(
//                   text: label,
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 TextSpan(
//                   text: " *",
//                   style: TextStyle(color: Colors.red),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(height: MediaQuery.of(context).size.height * 0.0185),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
//           child: showContainer
//               ? Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(color: Colors.redAccent),
//             ),
//             padding: EdgeInsets.symmetric(horizontal: 12),
//             child: Row(
//               children: [
//                 if (showPositionedBox)
//                   Positioned(
//                     left: 0,
//                     top: 0,
//                     bottom: 0,
//                     child: Container(
//                       width: calculatedSemiCircleWidth,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(calculatedBorderRadius),
//                           bottomLeft: Radius.circular(calculatedBorderRadius),
//                         ),
//                         border: Border(
//                           right: BorderSide(
//                             color: const Color(0xFF808080),
//                             width: 1.0,
//                           ),
//                         ),
//                       ),
//                       child: Center(
//                         child: positionedIcon != null
//                             ? Icon(
//                           positionedIcon,
//                           color: Colors.grey[400],
//                         )
//                             : null,
//                       ),
//                     ),
//                   ),
//                 Expanded(
//                   child: dropdownItems != null
//                       ? DropdownButtonFormField<String>(
//                     decoration: InputDecoration(
//                       hintText: hintText,
//                       border: InputBorder.none,
//                       prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
//                     ),
//                     value: controller?.text.isNotEmpty == true ? controller?.text : null,
//                     hint: Text(hintText),
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         controller?.text = newValue!;
//                       });
//                     },
//                     items: dropdownItems.map((String item) {
//                       return DropdownMenuItem<String>(
//                         value: item,
//                         child: Text(item),
//                       );
//                     }).toList(),
//                     validator: validator,
//                   )
//                       : TextFormField(
//                     controller: controller,
//                     decoration: InputDecoration(
//                       hintText: hintText,
//                       border: InputBorder.none,
//                       prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
//                       suffixIcon: suffixIcon,
//                     ),
//                     obscureText: obscureText,
//                     validator: validator,
//                     onTap: onTap,
//                     keyboardType: keyboardType,
//                   ),
//                 ),
//                 if (suffixIcon != null) suffixIcon,
//               ],
//             ),
//           )
//               : dropdownItems != null
//               ? DropdownButtonFormField<String>(
//             decoration: InputDecoration(
//               hintText: hintText,
//               prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             value: controller?.text.isNotEmpty == true ? controller?.text : null,
//             hint: Text(hintText),
//             onChanged: (String? newValue) {
//               setState(() {
//                 controller?.text = newValue!;
//               });
//             },
//             items: dropdownItems.map((String item) {
//               return DropdownMenuItem<String>(
//                 value: item,
//                 child: Text(item),
//               );
//             }).toList(),
//             validator: validator,
//           )
//               : TextFormField(
//             controller: controller,
//             decoration: InputDecoration(
//               hintText: hintText,
//               prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               suffixIcon: suffixIcon,
//             ),
//             obscureText: obscureText,
//             validator: validator,
//             onTap: onTap,
//             keyboardType: keyboardType,
//           ),
//         ),
//         SizedBox(height: MediaQuery.of(context).size.height * 0.0185),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Apis/api.dart';
import 'package:hiremi_version_two/api_services/user_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hiremi_version_two/Create_new_password.dart';
import 'package:hiremi_version_two/Custom_Widget/Curved_Container.dart';
import 'package:hiremi_version_two/Custom_Widget/Elevated_Button.dart';
import 'package:hiremi_version_two/Custom_Widget/SliderPageRoute.dart';
import 'package:hiremi_version_two/Custom_Widget/TextFeild.dart';

class VerifyUrEmail extends StatefulWidget {
  const VerifyUrEmail({Key? key}) : super(key: key);

  @override
  State<VerifyUrEmail> createState() => _VerifyUrEmailState();
}

class _VerifyUrEmailState extends State<VerifyUrEmail> {
  final UserService _userService = UserService();
  final TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  Future<void> validateOTP(String otp) async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await _userService.createPostApi({"otp": otp}, ApiUrls.otpValidation);
      setState(() {
        isLoading = false;
      });

      if (response.statusCode == 200) {
        // Store the OTP in shared preferences (example usage)
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('otp', otp);
        print("Hdjhf");
        Navigator.pushReplacement(
          context,
          SlidePageRoute(page: CreateNewPassword()),
        );
      } else {
        print(response.statusCode);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid OTP. Please try again.')),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again later.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'images/Hiremi_new_Icon.png',
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                ),
                Text(
                  "Verify Your Email Address",
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Hey, have You Received",
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Center(
                  child: Image.asset(
                    'images/EnterOTP.png',
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.32,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.0),
                CurvedContainer(
                  backgroundColor: Colors.white,
                  borderColor: Colors.black,
                  borderWidth: 0.53,
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.0215),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.0115),
                      buildLabeledTextField(
                        context,
                        "Enter One-Time Password",
                        "Enter Your OTP",
                        prefixIcon: Icons.lock_outline,
                        controller: otpController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your OTP';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.0185),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Please Enter your ",
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: "six digit ",
                              style: TextStyle(color: Colors.blue),
                            ),
                            TextSpan(
                              text: "that you have received in your mailbox.",
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: " ",
                              style: TextStyle(color: Colors.black),
                            ),
                            WidgetSpan(
                              child: TextButton(
                                onPressed: () {
                                  print("Resend OTP clicked");
                                },
                                child: Text(
                                  "Resend OTP",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.0285),
                      Center(
                        child: isLoading
                            ? CircularProgressIndicator()
                            : CustomElevatedButton(
                          width: MediaQuery.of(context).size.width * 0.775,
                          height: MediaQuery.of(context).size.height * 0.0625,
                          text: 'Confirm',
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              validateOTP(otpController.text.toString().trim());
                            }
                          },
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.0747),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLabeledTextField(
      BuildContext context,
      String label,
      String hintText, {
        bool showPositionedBox = false,
        IconData? positionedIcon,
        IconData? prefixIcon,
        bool obscureText = false,
        List<String>? dropdownItems,
        TextEditingController? controller,
        String? Function(String?)? validator,
        VoidCallback? onTap,
        TextInputType? keyboardType,
        Widget? suffixIcon,
        bool showContainer = false,
      }) {
    double calculatedBorderRadius = MediaQuery.of(context).size.width * 0.02;
    double calculatedSemiCircleWidth = MediaQuery.of(context).size.width * 0.08;
    double calculatedPaddingStart = MediaQuery.of(context).size.width * 0.1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: label,
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: " *",
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.0185),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
          child: showContainer
              ? Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.redAccent),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                if (showPositionedBox)
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      width: calculatedSemiCircleWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(calculatedBorderRadius),
                          bottomLeft: Radius.circular(calculatedBorderRadius),
                        ),
                        border: Border(
                          right: BorderSide(
                            color: const Color(0xFF808080),
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Center(
                        child: positionedIcon != null
                            ? Icon(
                          positionedIcon,
                          color: Colors.grey[400],
                        )
                            : null,
                      ),
                    ),
                  ),
                Expanded(
                  child: dropdownItems != null
                      ? DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintText: hintText,
                      border: InputBorder.none,
                      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
                    ),
                    value: controller?.text.isNotEmpty == true ? controller?.text : null,
                    hint: Text(hintText),
                    onChanged: (String? newValue) {
                      setState(() {
                        controller?.text = newValue!;
                      });
                    },
                    items: dropdownItems.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    validator: validator,
                  )
                      : TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: hintText,
                      border: InputBorder.none,
                      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
                      suffixIcon: suffixIcon,
                    ),
                    obscureText: obscureText,
                    validator: validator,
                    onTap: onTap,
                    keyboardType: keyboardType,
                  ),
                ),
                if (suffixIcon != null) suffixIcon,
              ],
            ),
          )
              : dropdownItems != null
              ? DropdownButtonFormField<String>(
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            value: controller?.text.isNotEmpty == true ? controller?.text : null,
            hint: Text(hintText),
            onChanged: (String? newValue) {
              setState(() {
                controller?.text = newValue!;
              });
            },
            items: dropdownItems.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            validator: validator,
          )
              : TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: suffixIcon,
            ),
            obscureText: obscureText,
            validator: validator,
            onTap: onTap,
            keyboardType: keyboardType,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.0185),
      ],
    );
  }
}
