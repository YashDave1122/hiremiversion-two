//   import 'package:flutter/material.dart';
//   import 'package:hiremi_version_two/Notofication_screen.dart';
//   import 'package:hiremi_version_two/bottomnavigationbar.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
//   import 'package:http/http.dart' as http;
//   import 'dart:convert';
//   class VerifiedPage extends StatefulWidget {
//     const VerifiedPage({Key? key, }) : super(key: key);
//
//     @override
//     State<VerifiedPage> createState() => _VerifiedPageState();
//   }
//
//   class _VerifiedPageState extends State<VerifiedPage> {
//     String Email="yashmanu0761@gmail.com";
//     @override
//     void initState() {
//       // TODO: implement initState
//
//
//         markedVerified();
//
//     }
//     Future<void> _printSavedEmail() async {
//       final prefs = await SharedPreferences.getInstance();
//       final email = prefs.getString('email') ?? 'No email saved';
//       print(email);
//       Email=email;
//     }
//     Future<void> fetchAndSaveFullName() async {
//       const String apiUrl = "http://13.127.81.177:8000/api/registers/";
//
//       try {
//         final response = await http.patch(Uri.parse(apiUrl));
//
//         if (response.statusCode == 200) {
//           final data = jsonDecode(response.body);
//
//
//           for (var user in data) {
//             if (user['email'] == Email) {
//               body: jsonEncode({
//                 'verified':true,
//               });
//
//
//               break;
//             }
//           }
//
//           if (Email.isEmpty) {
//             print('No matching email found');
//           }
//         } else {
//           print('Failed to fetch full name');
//           print(response.statusCode);
//           print(response.body);
//         }
//       } catch (e) {
//         print('Error: $e');
//       }
//     }
//     // Future<void> markedVerified() async {
//     //   const String apiUrl = "http://13.127.81.177:8000/api/registers/";
//     //
//     //   try {
//     //     final response = await http.patch(
//     //       Uri.parse('$apiUrl'), // Append email to the API URL
//     //       headers: {
//     //         'Content-Type': 'application/json',
//     //       },
//     //       body: jsonEncode({
//     //         'verified': true,
//     //       }),
//     //     );
//     //
//     //     if (response.statusCode == 200) {
//     //       final data = jsonDecode(response.body);
//     //
//     //       // Process the response data if needed
//     //       print('User verification updated successfully: $data');
//     //     } else {
//     //       print('Failed to update user verification');
//     //     }
//     //   } catch (e) {
//     //     print('Error: $e');
//     //   }
//     // }
//     Future<void> markedVerified() async {
//       if (Email.isEmpty) {
//         print('Email not found');
//         return;
//       }
//
//       final String apiUrl = "http://13.127.81.177:8000/api/registers/$Email/";
//
//       try {
//         final response = await http.patch(
//           Uri.parse(apiUrl),
//           headers: {
//             'Content-Type': 'application/json',
//           },
//           body: jsonEncode({
//             'verified': true,
//           }),
//         );
//
//         if (response.statusCode == 200) {
//           final data = jsonDecode(response.body);
//
//           // Process the response data if needed
//           print('User verification updated successfully: $data');
//         } else {
//           print('Failed to update user verification');
//           print(response.statusCode);
//           print(response.body);
//         }
//       } catch (e) {
//         print('Error: $e');
//       }
//     }
//     @override
//     Widget build(BuildContext context) {
//       final screenWidth = MediaQuery.of(context).size.width;
//       final screenHeight = MediaQuery.of(context).size.height;
//
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             "Hiremi's Home",
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           centerTitle: true,
//           actions: [
//             IconButton(
//               onPressed: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (ctx) => const NotificationScreen()));
//               },
//               icon: const Icon(Icons.notifications),
//             )
//           ],
//         ),
//         body: Center(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: screenHeight * 0.02,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'images/new_releases.png',
//                     width: screenWidth * 0.05,
//                     height: screenWidth * 0.05,
//                   ),
//                   Text(
//                     ' Payment Successful & Successfully Verified',
//                     style: TextStyle(
//                       color: Colors.green,
//                       fontSize:
//                           screenWidth * 0.037, // Adjusted for responsiveness
//                       fontWeight: FontWeight.bold,
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: screenHeight * 0.02,
//               ),
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Container(
//                     height: screenHeight * 0.45,
//                     child: Image.asset(
//                       'images/confetti bg.png',
//                       fit: BoxFit.cover,
//                       width: screenWidth,
//                     ),
//                   ),
//                   Positioned(
//                     top: screenHeight * 0.06,
//                     child: Image.asset(
//                       'images/Product quality-pana.png',
//                       width: screenWidth * 0.8,
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: screenHeight * 0.02,
//               ),
//               Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         'images/new_releases.png',
//                         width: screenWidth * 0.05,
//                         height: screenWidth * 0.05,
//                       ),
//                       Text(
//                         ' Verified users can access jobs & internships at Hiremi.',
//                         style: TextStyle(fontSize: screenWidth * 0.025),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: screenHeight * 0.02,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text('  '), // Placeholder for space
//                       Image.asset(
//                         'images/new_releases.png',
//                         width: screenWidth * 0.05,
//                         height: screenWidth * 0.05,
//                       ),
//                       Text(
//                         ' Verified users also get personalized career guidance.',
//                         style: TextStyle(fontSize: screenWidth * 0.025),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: screenHeight * 0.06,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushAndRemoveUntil(
//                         context,
//                         MaterialPageRoute(builder: (context) => const NewNavbar(isV: true,)),
//                         (Route<dynamic> route) => false,
//                       );
//                     },
//                     style: ButtonStyle(
//                       foregroundColor:
//                           WidgetStateProperty.all<Color>(Colors.white),
//                       backgroundColor:
//                           WidgetStateProperty.all<Color>(const Color(0xFFC1272D)),
//                       shape: WidgetStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                       ),
//                     ),
//                     child: Text(
//                       'Continue Exploration >',
//                       style: TextStyle(fontSize: screenWidth * 0.025),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       );
//     }
//   }
import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Notofication_screen.dart';
import 'package:hiremi_version_two/bottomnavigationbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VerifiedPage extends StatefulWidget {
  const VerifiedPage({Key? key}) : super(key: key);

  @override
  State<VerifiedPage> createState() => _VerifiedPageState();
}

class _VerifiedPageState extends State<VerifiedPage> {
  String email = " "; // Initial value for testing

  @override
  void initState() {
    super.initState();
    _printSavedEmail();
   // _checkEmail();
    //markedVerified();
  }

  Future<void> _printSavedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('email') ?? 'No email saved';
    setState(() {
      email = savedEmail;
    });
    print(email);
    _checkEmail();
  }

  Future<void> _checkEmail() async {
    // Example URL for fetching user data by email
    const String apiUrl = "http://13.127.81.177:8000/api/registers/";

    try {
      final response = await http.get(Uri.parse('$apiUrl?email=$email'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Update user verification based on fetched data
        for (var user in data) {
          if (user['email'] == email) {
            await updateUserVerificationStatus(user['id']);
            break;
          }
        }

        if (data.isEmpty) {
          print('No user found for email: $email');
        }
      } else {
        print('Failed to fetch user data');
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> updateUserVerificationStatus(int userId) async {
    // Example URL for updating user verification
    final String updateUrl = "http://13.127.81.177:8000/api/registers/$userId/";

    try {
      final response = await http.patch(
        Uri.parse(updateUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'verified': true,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('User verification updated successfully: $data');
      } else {
        print('Failed to update user verification');
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hiremi's Home",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => const NotificationScreen()));
            },
            icon: const Icon(Icons.notifications),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/new_releases.png',
                  width: screenWidth * 0.05,
                  height: screenWidth * 0.05,
                ),
                Text(
                  ' Payment Successful & Successfully Verified',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: screenWidth * 0.037,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: screenHeight * 0.45,
                  child: Image.asset(
                    'images/confetti bg.png',
                    fit: BoxFit.cover,
                    width: screenWidth,
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.06,
                  child: Image.asset(
                    'images/Product quality-pana.png',
                    width: screenWidth * 0.8,
                  ),
                )
              ],
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/new_releases.png',
                      width: screenWidth * 0.05,
                      height: screenWidth * 0.05,
                    ),
                    Text(
                      ' Verified users can access jobs & internships at Hiremi.',
                      style: TextStyle(fontSize: screenWidth * 0.025),
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('  '), // Placeholder for space
                    Image.asset(
                      'images/new_releases.png',
                      width: screenWidth * 0.05,
                      height: screenWidth * 0.05,
                    ),
                    Text(
                      ' Verified users also get personalized career guidance.',
                      style: TextStyle(fontSize: screenWidth * 0.025),
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.06,
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.pushAndRemoveUntil(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const NewNavbar(isV: true)),
                //
                //     );
                //   },
                //   style: ButtonStyle(
                //     foregroundColor:
                //     WidgetStateProperty.all<Color>(Colors.white),
                //     backgroundColor:
                //     WidgetStateProperty.all<Color>(const Color(0xFFC1272D)),
                //     shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                //       RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(8.0),
                //       ),
                //     ),
                //   ),
                //   child: Text(
                //     'Continue Exploration >',
                //     style: TextStyle(fontSize: screenWidth * 0.025),
                //   ),
                // ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewNavbar(isV: true),
                      ),
                          (route) => false, // This will remove all previous routes
                    );
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFC1272D)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Continue Exploration >',
                    style: TextStyle(fontSize: screenWidth * 0.025),
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
