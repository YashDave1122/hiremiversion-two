//
// import 'package:flutter/material.dart';
// import 'package:hiremi_version_two/api_services/user_services.dart';
// import 'package:http/http.dart' as http;
// import 'package:hiremi_version_two/Custom_Widget/Curved_Container.dart';
// import 'package:hiremi_version_two/Custom_Widget/Elevated_Button.dart';
// import 'package:hiremi_version_two/Custom_Widget/SliderPageRoute.dart';
// import 'package:hiremi_version_two/Custom_Widget/TextFeild.dart';
// import 'package:hiremi_version_two/Verify_ur_Email.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'api_services/base_services.dart';
//
// class Forget_Your_Password extends StatefulWidget {
//   const Forget_Your_Password({Key? key}) : super(key: key);
//
//   @override
//   State<Forget_Your_Password> createState() => _Forget_Your_PasswordState();
// }
//
// class _Forget_Your_PasswordState extends State<Forget_Your_Password> {
//   final UserService _userService = UserService();
//   final TextEditingController emailController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool isLoading = false;
//
//   Future<void> sendOTP(String email) async {
//     setState(() {
//       isLoading = true;
//     });
//
//     // Replace with your Django API endpoint URL
//     var apiUrl = 'http://13.127.81.177:8000/forgot-password/';
//
//     try {
//       var response = await http.post(
//         Uri.parse(apiUrl),
//         body: {'email': email},
//       );
//
//       if (response.statusCode == 200) {
//         // Successful response, navigate to VerifyUrEmail screen
//         Navigator.pushReplacement(
//           context,
//           SlidePageRoute(page: VerifyUrEmail()),
//         );
//       } else {
//         // Handle other status codes or errors
//         print('Failed to send OTP: ${response.statusCode}');
//         // Show error message to the user
//       }
//     } catch (e) {
//       // Handle network or server errors
//       print('Error sending OTP: $e');
//       // Show error message to the user
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   Future<void> storeCSRFToken(String csrfToken) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('csrfToken', csrfToken);
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
//                   "Forget Your Password",
//                   style: TextStyle(
//                     fontSize: 21.0,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 Text(
//                   "No worries, it happens!",
//                   style: TextStyle(
//                     fontSize: 21.0,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 Center(
//                   child: Image.asset(
//                     'images/Forget_your_Password.png',
//                     width: MediaQuery.of(context).size.width * 0.6,
//                     height: MediaQuery.of(context).size.height * 0.32,
//                   ),
//                 ),
//                 SizedBox(height: MediaQuery.of(context).size.height * 0.0),
//                 CurvedContainer(
//                   backgroundColor: Colors.white,
//                   borderColor: Colors.black,
//                   borderWidth: 0.53,
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.0215,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             right: MediaQuery.of(context).size.width * 0.09,
//                           ),
//                           child: RichText(
//                             text: TextSpan(
//                               children: [
//                                 TextSpan(
//                                   text: "Enter Email Address",
//                                   style: TextStyle(color: Colors.black),
//                                 ),
//                                 TextSpan(
//                                   text: " *",
//                                   style: TextStyle(
//                                     color: Colors.red,
//                                   ), // Red asterisk
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.0115,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: MediaQuery.of(context).size.width * 0.1,
//                           ),
//                           child: CurvedTextField(
//                             controller: emailController,
//                             hintText: "youremail@gmail.com",
//                             prefixIcon: Icons.account_circle,
//                             obscureText: false,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                              //   return 'Please enter your email id';
//
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.0185,
//                         ),
//                         Container(
//
//                         ),
//                         RichText(
//                           textAlign: TextAlign.center,
//                           text: TextSpan(
//                             children: [
//                               TextSpan(
//                                 text:
//                                 "Enter your email address to receive a ",
//                                 style: TextStyle(color: Colors.black),
//                               ),
//                               TextSpan(
//                                 text: "verification",
//                                 style: TextStyle(color: Colors.blue),
//                               ), // Change text color to blue
//                               TextSpan(
//                                 text: " code in\nyour mail box.",
//                                 style: TextStyle(color: Colors.black),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.0285,
//                         ),
//                         Center(
//                           child: isLoading
//                               ? CustomElevatedButton(
//                             width: MediaQuery.of(context).size.width * 0.775,
//                             height: MediaQuery.of(context).size.height * 0.0625,
//                             text: 'Sending OTP...',
//                             onPressed: () {},
//                           )
//                               : CustomElevatedButton(
//                             width: MediaQuery.of(context).size.width * 0.775,
//                             height: MediaQuery.of(context).size.height * 0.0625,
//                             text: 'Send OTP',
//                             onPressed: () async {
//                               if (_formKey.currentState!.validate()) {
//                                 Map<String, dynamic> body = {"email": emailController.text.trim()};
//
//                                 final response = await _userService.createPostApi(body, ApiUrls.forgetPaassword);
//                                 if (response.statusCode == 200) {
//                                   String csrfToken = response.headers['set-cookie'] ?? '';
//                                   await storeCSRFToken(csrfToken);
//                                   Navigator.pushReplacement(
//                                     context,
//                                     SlidePageRoute(page: VerifyUrEmail()),
//                                   );
//                                 }
//                               }
//                             },
//                           ),
//                         ),
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.0747,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hiremi_version_two/api_services/user_services.dart';
import 'package:http/http.dart' as http;
import 'package:hiremi_version_two/Custom_Widget/Curved_Container.dart';
import 'package:hiremi_version_two/Custom_Widget/Elevated_Button.dart';
import 'package:hiremi_version_two/Custom_Widget/SliderPageRoute.dart';
import 'package:hiremi_version_two/Custom_Widget/TextFeild.dart';
import 'package:hiremi_version_two/Verify_ur_Email.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_services/base_services.dart';

class Forget_Your_Password extends StatefulWidget {
  const Forget_Your_Password({Key? key}) : super(key: key);

  @override
  State<Forget_Your_Password> createState() => _Forget_Your_PasswordState();
}

class _Forget_Your_PasswordState extends State<Forget_Your_Password> {
  final UserService _userService = UserService();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  Future<void> sendOTP(String email) async {
    setState(() {
      isLoading = true;
    });

    // Replace with your Django API endpoint URL
    var apiUrl = 'http://13.127.81.177:8000/forgot-password/';

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        body: {'email': email},
      );

      if (response.statusCode == 200) {
        // Successful response, navigate to VerifyUrEmail screen
        Navigator.pushReplacement(
          context,
          SlidePageRoute(page: VerifyUrEmail()),
        );
      } else {
        // Handle other status codes or errors
        print('Failed to send OTP: ${response.statusCode}');
        // Show error message to the user
      }
    } catch (e) {
      // Handle network or server errors
      print('Error sending OTP: $e');
      // Show error message to the user
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> storeCSRFToken(String csrfToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('csrfToken', csrfToken);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
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
                  "Forget Your Password",
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "No worries, it happens!",
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Center(
                  child: Image.asset(
                    'images/Forget_your_Password.png',
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.32,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.0),
                CurvedContainer(
                  backgroundColor: Colors.white,
                  borderColor: Colors.black,
                  borderWidth: 0.53,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0215,
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(
                        //     right: MediaQuery.of(context).size.width * 0.09,
                        //   ),
                        //   child: RichText(
                        //     text: TextSpan(
                        //       children: [
                        //         TextSpan(
                        //           text: "Enter Email Address",
                        //           style: TextStyle(color: Colors.black),
                        //         ),
                        //         TextSpan(
                        //           text: " *",
                        //           style: TextStyle(
                        //             color: Colors.red,
                        //           ), // Red asterisk
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0115,
                        ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(
                        //     horizontal: MediaQuery.of(context).size.width * 0.1,
                        //   ),
                        //   child: CurvedTextField(
                        //     controller: emailController,
                        //     hintText: "youremail@gmail.com",
                        //     prefixIcon: Icons.account_circle,
                        //     obscureText: false,
                        //     validator: (value) {
                        //       if (value == null || value.isEmpty) {
                        //         //   return 'Please enter your email id';
                        //
                        //       }
                        //       return null;
                        //     },
                        //   ),
                        // ),
                        buildLabeledTextField(
                          context,
                          "Email Address",
                          "yourEmail@gmail.com",
                          controller: emailController,
                          prefixIcon: Icons.account_circle_outlined,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email address';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0185,
                        ),
                        Container(

                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                "Enter your email address to receive a ",
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: "verification",
                                style: TextStyle(color: Colors.blue),
                              ), // Change text color to blue
                              TextSpan(
                                text: " code in\nyour mail box.",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0285,
                        ),
                        Center(
                          child: isLoading
                              ? CustomElevatedButton(
                            width: MediaQuery.of(context).size.width * 0.775,
                            height: MediaQuery.of(context).size.height * 0.0625,
                            text: 'Sending OTP...',
                            onPressed: () {},
                          )
                              : CustomElevatedButton(
                            width: MediaQuery.of(context).size.width * 0.775,
                            height: MediaQuery.of(context).size.height * 0.0625,
                            text: 'Send OTP',
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                Map<String, dynamic> body = {"email": emailController.text.trim()};

                                final response = await _userService.createPostApi(body, ApiUrls.forgetPaassword);
                                if (response.statusCode == 200) {
                                  String csrfToken = response.headers['set-cookie'] ?? '';
                                  await storeCSRFToken(csrfToken);
                                  Navigator.pushReplacement(
                                    context,
                                    SlidePageRoute(page: VerifyUrEmail()),
                                  );
                                }
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0747,
                        ),
                      ],
                    ),
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
