// // import 'package:flutter/material.dart';
// // import 'package:hiremi_version_two/HomePage.dart';
// // import 'package:hiremi_version_two/Profile_Screen.dart';
// //
// // import 'package:hiremi_version_two/applies_screen.dart';
// // import 'package:hiremi_version_two/queries_screen.dart';
// // import 'package:percent_indicator/circular_percent_indicator.dart';
// //
// // class NewNavbar extends StatefulWidget {
// //   final bool isV;
// //   const NewNavbar({Key? key, required this.isV}) : super(key: key);
// //
// //   @override
// //   State<NewNavbar> createState() => _NewNavbarState();
// // }
// //
// // class _NewNavbarState extends State<NewNavbar> {
// //   int _selectedIndex = 0;
// //   final PageController _pageController = PageController();
// //
// //   late List<Widget> _pages;
// //   @override
// //   void initState() {
// //     super.initState();
// //     _pages = [
// //       HomePage(isVerified: widget.isV),
// //       AppliesScreen(isVerified: widget.isV),
// //       QueriesScreen(isVerified: widget.isV,),
// //       ProfileScreen()
// //     ];
// //   }
// //
// //   void _onItemTapped(int index) {
// //     setState(() {
// //       _selectedIndex = index;
// //     });
// //     _pageController.jumpToPage(index);
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     double screenWidth = MediaQuery.of(context).size.width;
// //     double spacing = (screenWidth - (4 * 50)) / 5;
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: Stack(
// //         children: [
// //           PageView(
// //             controller: _pageController,
// //             children: _pages
// //                 .map((page) => Navigator(
// //                       onGenerateRoute: (settings) {
// //                         return MaterialPageRoute(
// //                           builder: (context) => page,
// //                         );
// //                       },
// //                     ))
// //                 .toList(),
// //             onPageChanged: (index) {
// //               setState(() {
// //                 _selectedIndex = index;
// //               });
// //             },
// //           ),
// //           Positioned(
// //             bottom: 10,
// //             left: 20,
// //             right: 20,
// //             child: Container(
// //               height: 64,
// //               decoration: const BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.only(
// //                   topLeft: Radius.circular(16),
// //                   topRight: Radius.circular(16),
// //                   bottomLeft: Radius.circular(32),
// //                   bottomRight: Radius.circular(32),
// //                 ),
// //                 boxShadow: [
// //                   BoxShadow(
// //                     color: Colors.grey,
// //                     blurRadius: 10,
// //                     offset: Offset(0, 5),
// //                   ),
// //                 ],
// //               ),
// //               child: Padding(
// //                 padding: const EdgeInsets.all(16),
// //
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                   children: [
// //                     // SizedBox(width: spacing/2.5,),
// //                     _buildNavItem(Icons.home_filled, 'HOME', 0),
// //                     // SizedBox(
// //                     //   width: spacing,
// //                     // ),
// //                     _buildNavItem(Icons.event_note_outlined, 'APPLIES', 1),
// //                     SizedBox(
// //                       width: spacing*1.5,
// //                     ),
// //                     _buildNavItem(Icons.local_activity_outlined, 'QUERIES', 2),
// //                     // SizedBox(
// //                     //   width: spacing,
// //                     // ),
// //                     _buildNavItem(Icons.person_outline, 'PROFILE', 3),
// //                     //  SizedBox(width: spacing/2.5,),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //           // Positioned(
// //           //     bottom:
// //           //         10,
// //           //     left: 0,
// //           //     right: 0,
// //           //     child: SizedBox(height: 100, width: 5,child: Image.asset('assets/Rectangle 50.png'))
// //           //     ),
// //           Positioned(
// //             bottom: 35,
// //             left: screenWidth*0.5,
// //             right: screenWidth*0.5,
// //               child: CircularPercentIndicator(
// //             radius: 39,
// //             lineWidth: 15,
// //             percent: 0.50,
// //
// //             progressColor: const Color(0xFFC1272D),
// //             backgroundColor: Colors.transparent,
// //             startAngle: 90,
// //           )),
// //           Positioned(
// //             bottom: 25,
// //             left: 0,
// //             right: 0,
// //             child: Transform.translate(
// //               offset: const Offset(0, -20),
// //               child: Center(
// //                 child: SizedBox(
// //                   width: 64,
// //                   height: 64,
// //                   child: FloatingActionButton(
// //                     onPressed: () {
// //                       // Define the action for the FloatingActionButton here
// //                     },
// //                     backgroundColor: Colors.white,
// //                     shape: const CircleBorder(),
// //                     child: const Center(
// //                       child: Column(
// //                         children: [
// //                           SizedBox(
// //                             height: 10,
// //                           ),
// //                           Icon(
// //                             Icons.all_inclusive,
// //                             color: Color(0xFFC1272D),
// //                             size: 30,
// //                           ),
// //                           Text(
// //                             'HIREMI',
// //                             style: TextStyle(
// //                                 fontSize: 7, fontWeight: FontWeight.bold),
// //                           ),
// //                           Text(
// //                             '360',
// //                             style: TextStyle(
// //                                 fontSize: 6, color: Color(0xFFC1272D)),
// //                           )
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildNavItem(IconData icon, String label, int index) {
// //     return GestureDetector(
// //       onTap: () => _onItemTapped(index),
// //       child: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Icon(
// //             icon,
// //             size: 20,
// //             color: _selectedIndex == index
// //                 ? const Color(0xFFC1272D)
// //                 : Colors.black,
// //           ),
// //           Text(
// //             label,
// //             style: const TextStyle(
// //               fontSize: 8,
// //               color: Colors.black,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:hiremi_version_two/Custom_Widget/Custom_alert_box.dart';
// import 'package:hiremi_version_two/HomePage.dart';
// import 'package:hiremi_version_two/Profile_Screen.dart';
// import 'package:hiremi_version_two/applies_screen.dart';
// import 'package:hiremi_version_two/queries_screen.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
//
// class NewNavbar extends StatefulWidget {
//   final bool isV;
//   const NewNavbar({Key? key, required this.isV}) : super(key: key);
//
//   @override
//   State<NewNavbar> createState() => _NewNavbarState();
// }
//
// class _NewNavbarState extends State<NewNavbar> {
//   int _selectedIndex = 0;
//   final PageController _pageController = PageController();
//   final List<int> _navigationHistory = [];
//
//   late List<Widget> _pages;
//
//   @override
//   void initState() {
//     super.initState();
//     _pages = [
//       HomePage(isVerified: widget.isV),
//       AppliesScreen(isVerified: widget.isV),
//       QueriesScreen(isVerified: widget.isV),
//       ProfileScreen()
//     ];
//   }
//
//   // void _onItemTapped(int index) {
//   //   setState(() {
//   //     _navigationHistory.add(_selectedIndex);
//   //     _selectedIndex = index;
//   //   });
//   //   _pageController.jumpToPage(index);
//   // }
//   void _onItemTapped(int index) {
//     setState(() {
//       _navigationHistory.add(_selectedIndex);
//       _selectedIndex = index;
//     });
//
//     if (!widget.isV && index == 2) {  // Check if widget.isV is false and the index is Queries page
//       _showVerificationDialog();
//     } else {
//       if (widget.isV && index == 2) {
//         _pageController.jumpToPage(index);  // Navigate to QueriesScreen when isV is true
//       } else {
//         _pageController.jumpToPage(index);
//       }
//     }
//   }
//   void _showVerificationDialog() {
//     print("Hello  is _showVerificationDialog");
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//             contentPadding: EdgeInsets.zero,
//             backgroundColor: Colors.white,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//             content: const CustomAlertbox());
//       },
//     );
//   }
//
//   Future<bool> _onWillPop() async {
//     if (_navigationHistory.isNotEmpty) {
//       setState(() {
//         _selectedIndex = _navigationHistory.removeLast();
//       });
//       _pageController.jumpToPage(_selectedIndex);
//       return false;
//     }
//     return true;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double spacing = (screenWidth - (4 * 50)) / 5;
//
//     return WillPopScope(
//       onWillPop: _onWillPop,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Stack(
//           children: [
//             PageView(
//               controller: _pageController,
//               children: _pages
//                   .map((page) => Navigator(
//                 onGenerateRoute: (settings) {
//                   return MaterialPageRoute(
//                     builder: (context) => page,
//                   );
//                 },
//               ))
//                   .toList(),
//               onPageChanged: (index) {
//                 setState(() {
//                   _selectedIndex = index;
//                 });
//               },
//             ),
//             Positioned(
//               bottom: 10,
//               left: 20,
//               right: 20,
//               child: Container(
//                 height: 64,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(16),
//                     topRight: Radius.circular(16),
//                     bottomLeft: Radius.circular(32),
//                     bottomRight: Radius.circular(32),
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey,
//                       blurRadius: 10,
//                       offset: Offset(0, 5),
//                     ),
//                   ],
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       _buildNavItem(Icons.home_filled, 'HOME', 0),
//                       _buildNavItem(Icons.event_note_outlined, 'APPLIES', 1),
//                       SizedBox(
//                         width: spacing * 1.5,
//                       ),
//                       _buildNavItem(Icons.local_activity_outlined, 'QUERIES', 2),
//                       _buildNavItem(Icons.person_outline, 'PROFILE', 3),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 35,
//               left: screenWidth * 0.5 - 39,
//               child: CircularPercentIndicator(
//                 radius: 39,
//                 lineWidth: 15,
//                 percent: 0.50,
//                 progressColor: const Color(0xFFC1272D),
//                 backgroundColor: Colors.transparent,
//                 startAngle: 90,
//               ),
//             ),
//             Positioned(
//               bottom: 25,
//               left: 0,
//               right: 0,
//               child: Transform.translate(
//                 offset: const Offset(0, -20),
//                 child: Center(
//                   child: SizedBox(
//                     width: 64,
//                     height: 64,
//                     child: FloatingActionButton(
//                       onPressed: () {
//                         // Define the action for the FloatingActionButton here
//                       },
//                       backgroundColor: Colors.white,
//                       shape: const CircleBorder(),
//                       child: const Center(
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Icon(
//                               Icons.all_inclusive,
//                               color: Color(0xFFC1272D),
//                               size: 30,
//                             ),
//                             Text(
//                               'HIREMI',
//                               style: TextStyle(
//                                   fontSize: 7, fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               '360',
//                               style: TextStyle(
//                                   fontSize: 6, color: Color(0xFFC1272D)),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNavItem(IconData icon, String label, int index) {
//     return GestureDetector(
//       onTap: () => _onItemTapped(index),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             icon,
//             size: 20,
//             color: _selectedIndex == index
//                 ? const Color(0xFFC1272D)
//                 : Colors.black,
//           ),
//           Text(
//             label,
//             style: const TextStyle(
//               fontSize: 8,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/Custom_alert_box.dart';
import 'package:hiremi_version_two/HomePage.dart';
import 'package:hiremi_version_two/Profile_Screen.dart';
import 'package:hiremi_version_two/applies_screen.dart';
import 'package:hiremi_version_two/queries_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class NewNavbar extends StatefulWidget {
  final bool isV;
  const NewNavbar({Key? key, required this.isV}) : super(key: key);

  @override
  State<NewNavbar> createState() => _NewNavbarState();
}

class _NewNavbarState extends State<NewNavbar> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  final List<int> _navigationHistory = [];

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(isVerified: widget.isV),
      AppliesScreen(isVerified: widget.isV),
      QueriesScreen(isVerified: widget.isV),
      ProfileScreen()
    ];

    _pageController.addListener(() {
      int nextPage = _pageController.page!.round();
      if (nextPage == 2 && !widget.isV) {
        _pageController.jumpToPage(_selectedIndex);
        _showVerificationDialog();
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _navigationHistory.add(_selectedIndex);
      _selectedIndex = index;
    });

    if (!widget.isV && index == 2) {  // Check if widget.isV is false and the index is Queries page
      _showVerificationDialog();
    } else {
      _pageController.jumpToPage(index);
    }
  }

  void _showVerificationDialog() {
    print("Hello is _showVerificationDialog");
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

  Future<bool> _onWillPop() async {
    if (_navigationHistory.isNotEmpty) {
      setState(() {
        _selectedIndex = _navigationHistory.removeLast();
      });
      _pageController.jumpToPage(_selectedIndex);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double spacing = (screenWidth - (4 * 50)) / 5;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: _pages
                  .map((page) => Navigator(
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(
                    builder: (context) => page,
                  );
                },
              ))
                  .toList(),
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
            Positioned(
              bottom: 10,
              left: 20,
              right: 20,
              child: Container(
                height: 64,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildNavItem(Icons.home_filled, 'HOME', 0),
                      _buildNavItem(Icons.event_note_outlined, 'APPLIES', 1),
                      SizedBox(
                        width: spacing * 1.5,
                      ),
                      _buildNavItem(Icons.local_activity_outlined, 'QUERIES', 2),
                      _buildNavItem(Icons.person_outline, 'PROFILE', 3),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 35,
              left: screenWidth * 0.5 - 39,
              child: CircularPercentIndicator(
                radius: 39,
                lineWidth: 15,
                percent: 0.50,
                progressColor: const Color(0xFFC1272D),
                backgroundColor: Colors.transparent,
                startAngle: 90,
              ),
            ),
            Positioned(
              bottom: 25,
              left: 0,
              right: 0,
              child: Transform.translate(
                offset: const Offset(0, -20),
                child: Center(
                  child: SizedBox(
                    width: 64,
                    height: 64,
                    child: FloatingActionButton(
                      onPressed: () {
                        // Define the action for the FloatingActionButton here
                      },
                      backgroundColor: Colors.white,
                      shape: const CircleBorder(),
                      child: const Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Icon(
                              Icons.all_inclusive,
                              color: Color(0xFFC1272D),
                              size: 30,
                            ),
                            Text(
                              'HIREMI',
                              style: TextStyle(
                                  fontSize: 7, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '360',
                              style: TextStyle(
                                  fontSize: 6, color: Color(0xFFC1272D)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
            color: _selectedIndex == index
                ? const Color(0xFFC1272D)
                : Colors.black,
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 8,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
