// // import 'package:flutter/material.dart';
// // import 'package:hiremi_version_two/Edit_Profile_Section/BasicDetails/AddBasicDetails.dart';
// // import 'package:hiremi_version_two/Help_Support.dart';
// // import 'package:hiremi_version_two/Settings.dart';
// // import 'package:hiremi_version_two/about_us.dart';
// //
// // import 'package:percent_indicator/circular_percent_indicator.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // class DrawerChild extends StatefulWidget {
// //   final dynamic isVerified;
// //
// //   const DrawerChild({Key? key,required this.isVerified}) : super(key: key);
// //
// //   @override
// //   State<DrawerChild> createState() => _DrawerChildState();
// // }
// //
// // class _DrawerChildState extends State<DrawerChild> {
// //   String _fullName="";
// //   Future<void> _fetchFullName() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     String? fullName = prefs.getString('full_name') ?? 'No name saved';
// //     setState(() {
// //       _fullName = fullName;
// //     });
// //   }
// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     super.initState();
// //     if (_fullName.isEmpty) {
// //       _fetchFullName();
// //     }
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     final screenWidth = MediaQuery.of(context).size.width;
// //     final screenHeight = MediaQuery.of(context).size.height;
// //
// //     return Drawer(
// //       child: SingleChildScrollView(
// //         child: Container(
// //           color: Colors.white,
// //           padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
// //           child: Column(
// //             mainAxisSize: MainAxisSize.max,
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               SizedBox(height: screenHeight * 0.05),
// //               Center(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.center,
// //                   children: [
// //                     CircularPercentIndicator(
// //                       radius: screenWidth * 0.10,
// //                       lineWidth: 4,
// //                       percent: 0.25,
// //                       center: const Text('25%'),
// //                       progressColor: Colors.green,
// //                       backgroundColor: Colors.transparent,
// //                     ),
// //                     SizedBox(height: screenHeight * 0.01),
// //                     Text(
// //                       _fullName,
// //                       style: TextStyle(
// //                           fontSize: screenWidth * 0.04,
// //                           fontWeight: FontWeight.bold),
// //                     ),
// //                     SizedBox(height: screenHeight * 0.005),
// //                     Container(
// //                       height: screenHeight * 0.03,
// //                       decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.circular(screenWidth * 0.1),
// //                         border: Border.all(color: const Color(0xFFC1272D)),
// //                       ),
// //                       child: Padding(
// //                         padding: EdgeInsets.all(screenWidth * 0.01),
// //                         child: Row(
// //                           mainAxisSize: MainAxisSize.min,
// //                           children: [
// //                             Icon(
// //                               Icons.check_circle,
// //                               color: const Color(0xFFC1272D),
// //                               size: screenWidth * 0.02,
// //                             ),
// //                             Text(
// //                               ' Not verified',
// //                               style: TextStyle(
// //                                   color: const Color(0xFFC1272D),
// //                                   fontSize: screenWidth * 0.02),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                     SizedBox(height: screenHeight * 0.005),
// //                     Text(
// //                       'Last updated today',
// //                       style: TextStyle(
// //                           fontSize: screenWidth * 0.02, color: Colors.grey),
// //                     ),
// //                     SizedBox(height: screenHeight * 0.005),
// //                     TextButton(
// //                       onPressed: () {
// //                         Navigator.of(context).push(MaterialPageRoute(
// //                             builder: (ctx) => const AddBasicDetails()));
// //                       },
// //                       style: ButtonStyle(
// //                         foregroundColor:
// //                             WidgetStateProperty.all<Color>(Colors.white),
// //                         backgroundColor: WidgetStateProperty.all<Color>(
// //                             const Color(0xFFC1272D)),
// //                         shape: WidgetStateProperty.all<RoundedRectangleBorder>(
// //                           RoundedRectangleBorder(
// //                             borderRadius:
// //                                 BorderRadius.circular(screenWidth * 0.02),
// //                           ),
// //                         ),
// //                       ),
// //                       child: Text(
// //                         'Edit Profile >',
// //                         style: TextStyle(fontSize: screenWidth * 0.02),
// //                       ),
// //                     ),
// //                     SizedBox(height: screenHeight * 0.04),
// //                   ],
// //                 ),
// //               ),
// //               Container(
// //                 width: screenWidth * 0.9,
// //                 height: 1,
// //                 color: Colors.grey,
// //               ),
// //               SizedBox(height: screenHeight * 0.04),
// //               ListTile(
// //                   leading: Container(
// //                     height: screenHeight * 0.04,
// //                     width: screenHeight * 0.04,
// //                     decoration: BoxDecoration(
// //                       color: const Color(0xFFFBEEEE),
// //                       borderRadius: BorderRadius.circular(screenHeight * 0.01),
// //                     ),
// //                     child: const Icon(
// //                       Icons.settings,
// //                       color: Color(0xFFC1272D),
// //                     ),
// //                   ),
// //                   title: Text(
// //                     'Settings',
// //                     style: TextStyle(fontSize: screenWidth * 0.034),
// //                   ),
// //                   trailing: IconButton(
// //                       style: const ButtonStyle(
// //                           backgroundColor:
// //                               WidgetStatePropertyAll(Color(0xFFECF5FF))),
// //                       onPressed: () {
// //                         Navigator.of(context).push(MaterialPageRoute(
// //                             builder: (ctx) => SettingsScreen()));
// //                       },
// //                       icon: const Icon(Icons.navigate_next))),
// //               SizedBox(height: screenHeight * 0.005),
// //               ListTile(
// //                   leading: Container(
// //                     height: screenHeight * 0.04,
// //                     width: screenHeight * 0.04,
// //                     decoration: BoxDecoration(
// //                       color: const Color(0xFFFBEEEE),
// //                       borderRadius: BorderRadius.circular(screenHeight * 0.01),
// //                     ),
// //                     child: const Icon(
// //                       Icons.lock_open_outlined,
// //                       color: Color(0xFFC1272D),
// //                     ),
// //                   ),
// //                   title: Text(
// //                     'Change Password',
// //                     style: TextStyle(fontSize: screenWidth * 0.034),
// //                   ),
// //                   trailing: IconButton(
// //                       style: const ButtonStyle(
// //                           backgroundColor:
// //                               WidgetStatePropertyAll(Color(0xFFECF5FF))),
// //                       onPressed: () {},
// //                       icon: const Icon(Icons.navigate_next))),
// //               SizedBox(height: screenHeight * 0.005),
// //               ListTile(
// //                   leading: Container(
// //                     height: screenHeight * 0.04,
// //                     width: screenHeight * 0.04,
// //                     decoration: BoxDecoration(
// //                       color: const Color(0xFFFBEEEE),
// //                       borderRadius: BorderRadius.circular(screenHeight * 0.01),
// //                     ),
// //                     child: const Icon(
// //                       Icons.info,
// //                       color: Color(0xFFC1272D),
// //                     ),
// //                   ),
// //                   title: Text(
// //                     'About App',
// //                     style: TextStyle(fontSize: screenWidth * 0.034),
// //                   ),
// //                   trailing: IconButton(
// //                       style: const ButtonStyle(
// //                           backgroundColor:
// //                               WidgetStatePropertyAll(Color(0xFFECF5FF))),
// //                       onPressed: () {
// //                         Navigator.of(context).push(
// //                             MaterialPageRoute(builder: (ctx) => const About_Us()));
// //                       },
// //                       icon: const Icon(Icons.navigate_next))),
// //               SizedBox(
// //                 height: screenHeight * 0.25,
// //               ),
// //               ListTile(
// //                   leading: Container(
// //                     height: screenHeight * 0.04,
// //                     width: screenHeight * 0.04,
// //                     decoration: BoxDecoration(
// //                       color: const Color(0xFFFBEEEE),
// //                       borderRadius: BorderRadius.circular(screenHeight * 0.01),
// //                     ),
// //                     child: const Icon(
// //                       Icons.support_agent_outlined,
// //                       color: Color(0xFFC1272D),
// //                     ),
// //                   ),
// //                   title: Text(
// //                     'Help and Support',
// //                     style: TextStyle(fontSize: screenWidth * 0.034),
// //                   ),
// //                   trailing: IconButton(
// //                       style: const ButtonStyle(
// //                           backgroundColor:
// //                               WidgetStatePropertyAll(Color(0xFFECF5FF))),
// //                       onPressed: () {
// //                         Navigator.of(context).push(
// //                             MaterialPageRoute(builder: (ctx) => const HelpSupport()));
// //                       },
// //                       icon: const Icon(Icons.navigate_next))),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:hiremi_version_two/Edit_Profile_Section/BasicDetails/AddBasicDetails.dart';
// import 'package:hiremi_version_two/Help_Support.dart';
// import 'package:hiremi_version_two/Settings.dart';
// import 'package:hiremi_version_two/about_us.dart';
//
// import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class DrawerChild extends StatefulWidget {
//   final dynamic isVerified;
//
//   const DrawerChild({Key? key, required this.isVerified}) : super(key: key);
//
//   @override
//   State<DrawerChild> createState() => _DrawerChildState();
// }
//
// class _DrawerChildState extends State<DrawerChild> {
//   String _fullName = "";
//   Future<void> _fetchFullName() async {
//     final prefs = await SharedPreferences.getInstance();
//     String? fullName = prefs.getString('full_name') ?? 'No name saved';
//     setState(() {
//       _fullName = fullName;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     if (_fullName.isEmpty) {
//       _fetchFullName();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Drawer(
//       child: SingleChildScrollView(
//         child: Container(
//           color: Colors.white,
//           padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: screenHeight * 0.05),
//               Center(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     CircularPercentIndicator(
//                       radius: screenWidth * 0.10,
//                       lineWidth: 4,
//                       percent: 0.25,
//                       center: const Text('25%'),
//                       progressColor: Colors.green,
//                       backgroundColor: Colors.transparent,
//                     ),
//                     SizedBox(height: screenHeight * 0.01),
//                     Text(
//                       _fullName,
//                       style: TextStyle(
//                           fontSize: screenWidth * 0.04,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: screenHeight * 0.005),
//                     Container(
//                       height: screenHeight * 0.03,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(screenWidth * 0.1),
//                         border: Border.all(
//                           color: widget.isVerified
//                               ? Colors.green
//                               : const Color(0xFFC1272D),
//                         ),
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.all(screenWidth * 0.01),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Icon(
//                               Icons.check_circle,
//                               color: widget.isVerified
//                                   ? Colors.green
//                                   : const Color(0xFFC1272D),
//                               size: screenWidth * 0.02,
//                             ),
//                             Text(
//                               widget.isVerified ? ' Verified' : ' Not verified',
//                               style: TextStyle(
//                                   color: widget.isVerified
//                                       ? Colors.green
//                                       : const Color(0xFFC1272D),
//                                   fontSize: screenWidth * 0.02),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.005),
//                     Text(
//                       'Last updated today',
//                       style: TextStyle(
//                           fontSize: screenWidth * 0.02, color: Colors.grey),
//                     ),
//                     SizedBox(height: screenHeight * 0.005),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (ctx) => const AddBasicDetails()));
//                       },
//                       style: ButtonStyle(
//                         foregroundColor:
//                         MaterialStateProperty.all<Color>(Colors.white),
//                         backgroundColor: MaterialStateProperty.all<Color>(
//                             const Color(0xFFC1272D)),
//                         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                             borderRadius:
//                             BorderRadius.circular(screenWidth * 0.02),
//                           ),
//                         ),
//                       ),
//                       child: Text(
//                         'Edit Profile >',
//                         style: TextStyle(fontSize: screenWidth * 0.02),
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.04),
//                   ],
//                 ),
//               ),
//               Container(
//                 width: screenWidth * 0.9,
//                 height: 1,
//                 color: Colors.grey,
//               ),
//               SizedBox(height: screenHeight * 0.04),
//               ListTile(
//                   leading: Container(
//                     height: screenHeight * 0.04,
//                     width: screenHeight * 0.04,
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFFBEEEE),
//                       borderRadius: BorderRadius.circular(screenHeight * 0.01),
//                     ),
//                     child: const Icon(
//                       Icons.settings,
//                       color: Color(0xFFC1272D),
//                     ),
//                   ),
//                   title: Text(
//                     'Settings',
//                     style: TextStyle(fontSize: screenWidth * 0.034),
//                   ),
//                   trailing: IconButton(
//                       onPressed: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (ctx) => SettingsScreen()));
//                       },
//                       icon: const Icon(Icons.navigate_next))),
//               SizedBox(height: screenHeight * 0.005),
//               ListTile(
//                   leading: Container(
//                     height: screenHeight * 0.04,
//                     width: screenHeight * 0.04,
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFFBEEEE),
//                       borderRadius: BorderRadius.circular(screenHeight * 0.01),
//                     ),
//                     child: const Icon(
//                       Icons.lock_open_outlined,
//                       color: Color(0xFFC1272D),
//                     ),
//                   ),
//                   title: Text(
//                     'Change Password',
//                     style: TextStyle(fontSize: screenWidth * 0.034),
//                   ),
//                   trailing: IconButton(
//                       onPressed: () {},
//                       icon: const Icon(Icons.navigate_next))),
//               SizedBox(height: screenHeight * 0.005),
//               ListTile(
//                   leading: Container(
//                     height: screenHeight * 0.04,
//                     width: screenHeight * 0.04,
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFFBEEEE),
//                       borderRadius: BorderRadius.circular(screenHeight * 0.01),
//                     ),
//                     child: const Icon(
//                       Icons.info,
//                       color: Color(0xFFC1272D),
//                     ),
//                   ),
//                   title: Text(
//                     'About App',
//                     style: TextStyle(fontSize: screenWidth * 0.034),
//                   ),
//                   trailing: IconButton(
//                       onPressed: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (ctx) => const About_Us()));
//                       },
//                       icon: const Icon(Icons.navigate_next))),
//               SizedBox(
//                 height: screenHeight * 0.25,
//               ),
//               ListTile(
//                   leading: Container(
//                     height: screenHeight * 0.04,
//                     width: screenHeight * 0.04,
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFFBEEEE),
//                       borderRadius: BorderRadius.circular(screenHeight * 0.01),
//                     ),
//                     child: const Icon(
//                       Icons.support_agent_outlined,
//                       color: Color(0xFFC1272D),
//                     ),
//                   ),
//                   title: Text(
//                     'Help and Support',
//                     style: TextStyle(fontSize: screenWidth * 0.034),
//                   ),
//                   trailing: IconButton(
//                       onPressed: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (ctx) => const HelpSupport()));
//                       },
//                       icon: const Icon(Icons.navigate_next))),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/Custom_alert_box.dart';
import 'package:hiremi_version_two/Custom_Widget/SliderPageRoute.dart';
import 'package:hiremi_version_two/Edit_Profile_Section/BasicDetails/AddBasicDetails.dart';
import 'package:hiremi_version_two/Forget_Your_Password.dart';
import 'package:hiremi_version_two/Help_Support.dart';
import 'package:hiremi_version_two/HiremiScreen.dart';
import 'package:hiremi_version_two/Login.dart';
import 'package:hiremi_version_two/Settings.dart';
import 'package:hiremi_version_two/about_us.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerChild extends StatefulWidget {
  final bool isVerified; // Changed dynamic to bool

  const DrawerChild({Key? key, required this.isVerified}) : super(key: key);

  @override
  State<DrawerChild> createState() => _DrawerChildState();
}

class _DrawerChildState extends State<DrawerChild> {
  String _fullName = "";

  Future<void> _fetchFullName() async {
    final prefs = await SharedPreferences.getInstance();
    String? fullName = prefs.getString('full_name') ?? 'No name saved';
    setState(() {
      _fullName = fullName;
    });
  }
  void _showVerificationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: const CustomAlertbox(),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    if (_fullName.isEmpty) {
      _fetchFullName();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.05),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularPercentIndicator(
                      radius: screenWidth * 0.10,
                      lineWidth: 4,
                      percent: 0.25,
                      center: const Text('25%'),
                      progressColor: Colors.green,
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      _fullName,
                      style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Container(
                      height: screenHeight * 0.03,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * 0.1),
                        border: Border.all(
                          color: widget.isVerified
                              ? Colors.green
                              : const Color(0xFFC1272D),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.01),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: widget.isVerified
                                  ? Colors.green
                                  : const Color(0xFFC1272D),
                              size: screenWidth * 0.02,
                            ),
                            Text(
                              widget.isVerified ? ' Verified' : ' Not verified',
                              style: TextStyle(
                                  color: widget.isVerified
                                      ? Colors.green
                                      : const Color(0xFFC1272D),
                                  fontSize: screenWidth * 0.02),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Text(
                      'Last updated today',
                      style: TextStyle(
                          fontSize: screenWidth * 0.02, color: Colors.grey),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    TextButton(
                      onPressed: () {
                        if (widget.isVerified) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const AddBasicDetails()));
                        } else {
                          _showVerificationDialog();
                        }
                      },
                      style: ButtonStyle(
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFC1272D)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(screenWidth * 0.02),
                          ),
                        ),
                      ),
                      child: Text(
                        'Edit Profile >',
                        style: TextStyle(fontSize: screenWidth * 0.02),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                  ],
                ),
              ),
              Container(
                width: screenWidth * 0.9,
                height: 1,
                color: Colors.grey,
              ),
              SizedBox(height: screenHeight * 0.04),
              ListTile(
                  leading: Container(
                    height: screenHeight * 0.04,
                    width: screenHeight * 0.04,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBEEEE),
                      borderRadius: BorderRadius.circular(screenHeight * 0.01),
                    ),
                    child: const Icon(
                      Icons.settings,
                      color: Color(0xFFC1272D),
                    ),
                  ),
                  title: Text(
                    'Settings',
                    style: TextStyle(fontSize: screenWidth * 0.034),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) =>  SettingsScreen()));
                      },
                      icon: const Icon(Icons.navigate_next))),
              SizedBox(height: screenHeight * 0.005),
              ListTile(
                  leading: Container(
                    height: screenHeight * 0.04,
                    width: screenHeight * 0.04,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBEEEE),
                      borderRadius: BorderRadius.circular(screenHeight * 0.01),
                    ),
                    child: const Icon(
                      Icons.lock_open_outlined,
                      color: Color(0xFFC1272D),
                    ),
                  ),
                  title: Text(
                    'Change Password',
                    style: TextStyle(fontSize: screenWidth * 0.034),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          SlidePageRoute(page: Forget_Your_Password()),
                        );
                      },
                      icon: const Icon(Icons.navigate_next))),
              SizedBox(height: screenHeight * 0.005),
              ListTile(
                  leading: Container(
                    height: screenHeight * 0.04,
                    width: screenHeight * 0.04,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBEEEE),
                      borderRadius: BorderRadius.circular(screenHeight * 0.01),
                    ),
                    child: const Icon(
                      Icons.info,
                      color: Color(0xFFC1272D),
                    ),
                  ),
                  title: Text(
                    'About App',
                    style: TextStyle(fontSize: screenWidth * 0.034),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const About_Us()));
                      },
                      icon: const Icon(Icons.navigate_next))),
              SizedBox(height: screenHeight * 0.005),
              ListTile(
                  leading: Container(
                    height: screenHeight * 0.04,
                    width: screenHeight * 0.04,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBEEEE),
                      borderRadius: BorderRadius.circular(screenHeight * 0.01),
                    ),
                    child: const Icon(
                      Icons.support_agent_outlined,
                      color: Color(0xFFC1272D),
                    ),
                  ),
                  title: Text(
                    'Help and Support',
                    style: TextStyle(fontSize: screenWidth * 0.034),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const HelpSupport()));
                      },
                      icon: const Icon(Icons.navigate_next))),
              SizedBox(
                height: screenHeight * 0.18,
              ),
              ListTile(
                  leading: Container(
                    height: screenHeight * 0.04,
                    width: screenHeight * 0.04,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBEEEE),
                      borderRadius: BorderRadius.circular(screenHeight * 0.01),
                    ),
                    child: const Icon(
                      Icons.support_agent_outlined,
                      color: Color(0xFFC1272D),
                    ),
                  ),
                  title: Text(
                    'LogOut',
                    style: TextStyle(fontSize: screenWidth * 0.034),
                  ),
                  trailing: IconButton(
                      onPressed: ()async {
                        var sharedpref=await SharedPreferences.getInstance();
                        sharedpref.setBool(HiremiScreenState.KEYLOGIN, false);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const LogIn()));
                      },
                      icon: const Icon(Icons.navigate_next))),
            ],
          ),
        ),
      ),
    );
  }
}
