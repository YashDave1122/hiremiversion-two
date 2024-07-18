// import 'package:flutter/material.dart';
// import 'package:hiremi_version_two/verified_page.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
//
// class VerificationScreen3 extends StatefulWidget {
//   const VerificationScreen3({Key? key}) : super(key: key);
//
//   @override
//   State<VerificationScreen3> createState() => _VerificationScreen3State();
// }
//
// class _VerificationScreen3State extends State<VerificationScreen3> {
// final _formKey = GlobalKey<FormState>();
//
//
//   final TextEditingController _IntrestedDomainController = TextEditingController();
//   final TextEditingController _fatherNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _dobController = TextEditingController();
//   final TextEditingController _birthPlaceController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _whatsappController = TextEditingController();
//   final TextEditingController _collegeNameController = TextEditingController();
//   final TextEditingController _collegeStateController = TextEditingController();
//   final TextEditingController _branchController = TextEditingController();
//   final TextEditingController _degreeController = TextEditingController();
//   final TextEditingController _passingYearController = TextEditingController();
//   final TextEditingController _EnrollementNumberController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();
//
//   @override
//   void dispose() {
//     // Dispose controllers to free up resources
//
//     _fatherNameController.dispose();
//     _emailController.dispose();
//     _dobController.dispose();
//     _birthPlaceController.dispose();
//     _phoneController.dispose();
//     _whatsappController.dispose();
//     _collegeNameController.dispose();
//     _branchController.dispose();
//     _degreeController.dispose();
//     _passingYearController.dispose();
//
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }
//
//   bool _isAllFieldsValid() {
//     return _formKey.currentState?.validate() ?? false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var screenHeight = MediaQuery.of(context).size.height;
//     var screenWidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Review & Verify Your Profile',
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Center(
//               child: Column(
//                 children: [
//                   CircularPercentIndicator(
//                     radius: screenHeight * 0.05,
//                     lineWidth: 6,
//                     percent: 0.95,
//                     center: const Text(
//                       '95%',
//                       style: TextStyle(
//                           color: Colors.green, fontWeight: FontWeight.bold),
//                     ),
//                     progressColor: Colors.green,
//                     backgroundColor: Colors.grey.shade300,
//                   ),
//                   SizedBox(height: screenHeight * 0.0075),
//                   const Text(
//                     'Harsh Pawar',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: screenHeight * 0.0075),
//                   Container(
//                     // height: screenHeight * 0.03,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(screenWidth * 0.1),
//                       border: Border.all(color: const Color(0xFFC1272D)),
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.all(screenWidth * 0.01),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(
//                             Icons.check_circle,
//                             color: const Color(0xFFC1272D),
//                             size: screenWidth * 0.02,
//                           ),
//                           Text(
//                             ' Not verified',
//                             style: TextStyle(
//                               color: const Color(0xFFC1272D),
//                               fontSize: screenWidth *
//                                   0.02, // Adjusted based on screen width
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             SizedBox(height: MediaQuery.of(context).size.height * 0.0425),
//             Container(
//               height: 1,
//               width: screenWidth * 0.9,
//               color: Colors.grey,
//             ),
//
//             // backgroundColor: Colors.white,
//             // borderColor: Colors.black,
//             // borderWidth: 0.53,
//             Form(
//               key: _formKey,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: screenHeight * 0.02),
//                       Padding(
//                         padding: EdgeInsets.all(screenWidth*0.04),
//                         child: const Text(
//                           'Contact Information',
//                           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                           textAlign: TextAlign.start,
//                         ),
//                       ),
//                       SizedBox(height: screenHeight * 0.01),
//                       buildLabeledTextField(
//                         context,
//                         "Enrollment Number / Roll Number / College ID / UAN Number etc.",
//                         "0105IT171125",
//
//                         controller: _EnrollementNumberController,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your enrollment number';
//                           }
//                           if (value.length < 10) {
//                             return 'Please enter a valid number';
//                           }
//                           return null;
//                         },
//                       ),
//                       buildLabeledTextField(
//                         context,
//                         "Interest Domain*",
//                         "Domain",
//                         keyboardType: TextInputType.text,
//                         controller: _IntrestedDomainController,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your Domain';
//                           }
//
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: MediaQuery.of(context).size.height * 0.02),
//                       Row(
//                         children: [
//                           const Spacer(),
//                           Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8),
//                                 color: const Color(0xFFC1272D),
//                               ),
//                               child: TextButton(
//                                 onPressed: () {
//                                   if (_isAllFieldsValid()) {
//                                     Navigator.of(context).push(MaterialPageRoute(
//                                         builder: (ctx) => const VerifiedPage()));
//                                   } else {
//                                     setState(() {});
//                                   }
//                                 },
//                                 child: Text(
//                                   'Review & Next >',
//                                   style: TextStyle(
//                                       fontSize: screenHeight * 0.015,
//                                       color: Colors.white),
//                                 ),
//                               ),
//                             ),
//                         ],
//                       ),
//                       const SizedBox(height: 70),
//                     ],
//                   ),
//                 ),
//               ),
//
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildSectionHeader(String title) {
//     return Padding(
//       padding: EdgeInsets.symmetric(
//           vertical: MediaQuery.of(context).size.height * 0.02),
//       child: Text(
//         title,
//         style: const TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),
//     );
//   }
//
//   Widget buildLabeledTextField(
//     BuildContext context,
//     String label,
//     String hintText, {
//     bool showPositionedBox = false,
//     IconData? prefixIcon,
//     bool obscureText = false,
//     List<String>? dropdownItems,
//     TextEditingController? controller,
//     String? Function(String?)? validator,
//     VoidCallback? onTap,
//     TextInputType? keyboardType,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(
//               horizontal: MediaQuery.of(context).size.width * 0.04),
//           child: RichText(
//             text: TextSpan(
//               children: [
//                 TextSpan(
//                   text: label,
//                   style: const TextStyle(color: Colors.black),
//                 ),
//                 const TextSpan(
//                   text: " *",
//                   style: TextStyle(color: Colors.red),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(height: MediaQuery.of(context).size.height * 0.0185),
//         Padding(
//           padding: EdgeInsets.symmetric(
//               horizontal: MediaQuery.of(context).size.width * 0.04),
//           child: dropdownItems != null
//               ? DropdownButtonFormField<String>(
//                   decoration: InputDecoration(
//                     hintText: hintText,
//                     prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   value: controller?.text.isNotEmpty == true
//                       ? controller?.text
//                       : null,
//                   hint: Text(hintText),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       controller?.text = newValue!;
//                     });
//                   },
//                   items: dropdownItems.map((String item) {
//                     return DropdownMenuItem<String>(
//                       value: item,
//                       child: Text(item),
//                     );
//                   }).toList(),
//                   validator: validator,
//                   isExpanded: true,
//                 )
//               : TextFormField(
//                   controller: controller,
//                   decoration: InputDecoration(
//                     hintText: hintText,
//                     prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   obscureText: obscureText,
//                   validator: validator,
//                   onTap: onTap,
//                   keyboardType: keyboardType,
//                 ),
//         ),
//         SizedBox(height: MediaQuery.of(context).size.height * 0.0185),
//       ],
//     );
//   }
//
//
//   Widget buildStateDropdown() {
//     return Padding(
//       padding: EdgeInsets.symmetric(
//         horizontal: MediaQuery.of(context).size.width * 0.045,
//         vertical: MediaQuery.of(context).size.height * 0.01,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: MediaQuery.of(context).size.height * 0.01),
//         ],
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hiremi_version_two/paytmPayment.dart';
import 'package:hiremi_version_two/verified_page.dart';
import 'package:paytm_routersdk/paytm_routersdk.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerificationScreen3 extends StatefulWidget {
  const VerificationScreen3({Key? key}) : super(key: key);

  @override
  State<VerificationScreen3> createState() => _VerificationScreen3State();
}

class _VerificationScreen3State extends State<VerificationScreen3> {
  final _formKey = GlobalKey<FormState>();
  String _fullName="";
  double amount=1;
  String Email="";

  final TextEditingController _IntrestedDomainController = TextEditingController();
  final TextEditingController _EnrollementNumberController = TextEditingController();

  @override
  void dispose() {
    _IntrestedDomainController.dispose();
    _EnrollementNumberController.dispose();
    super.dispose();
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (_fullName.isEmpty) {
      _fetchFullName();
    }
    if (Email.isEmpty) {
      _printSavedEmail();
    }
  }
  bool _isAllFieldsValid() {
    return _formKey.currentState?.validate() ?? false;
  }


  Future<void> _printSavedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email') ?? 'No email saved';
    print(email);
    Email=email;
  }
  Future<void> _fetchFullName() async {
    final prefs = await SharedPreferences.getInstance();
    String? fullName = prefs.getString('full_name') ?? 'No name saved';
    setState(() {
      _fullName = fullName;
    });
  }
  Future<Map?> _initiateTransaction(String txnToken, String orderId, String amount, String mid, String callbackUrl, bool isStaging) async {
    try {
      // Initiate the transaction using Paytm Router SDK
      var transactionResponse = await PaytmRouterSdk.startTransaction(mid, orderId, amount, txnToken, callbackUrl, isStaging);

      // Handle the transaction response

      if (transactionResponse != null && transactionResponse['STATUS'] == 'TXN_SUCCESS') {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => const VerifiedPage()));
        print("Success");
        checkOrderStatus(orderId);


        return transactionResponse;
      } else {
        checkOrderStatus(orderId);
        throw Exception('Transaction failed: ${transactionResponse!['RESPMSG']}');
      }
    } catch (e) {
      // Error occurred during transaction initiation
      throw Exception('Error initiating transaction: $e');
    }
  }

  Future<void> _printSavedValues() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? enrollmentNumber = prefs.getString('enrollmentNumber');
    String? interestedDomain = prefs.getString('interestedDomain');
    print('Enrollment Number: $enrollmentNumber');
    print('Interested Domain: $interestedDomain');
  }
  final String orderStatusUrl = 'http://13.127.81.177:8000/order-status/';
  Future<void> checkOrderStatus(String orderId) async {
    try {
      final response = await http.post(
        Uri.parse('$orderStatusUrl'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"order_id": orderId}),
      );

      if (response.statusCode == 200) {
        print("Order is complete");
        print(response.statusCode);
        print(response.body);
      } else {
        print("Order is not complete");
        print(response.statusCode);
        print(response.body);
      }
    } catch (e) {
      print("Error: $e");
    }
  }
  Future<void> _makeTransactionRequest(double amount) async {

    try {
      print("Helllo");
      // Ensure email is loaded



      // API endpoint
      var url = 'http://13.127.81.177:8000/pay/';

      // Generate a unique order ID
      var orderId = DateTime.now().millisecondsSinceEpoch.toString();

      // Parameters
      var params = {
        'name': _fullName,
        'amount': amount.toString(),
        'orderId': orderId,
        'email': "yashmanu0761@gmail.com" // Add email to the parameters
      };

      var response = await http.post(
        Uri.parse(url),
        body: json.encode(params),
        headers: {'Content-Type': 'application/json'},
      );

      // Checking response status
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        print('Response data: $responseData'); // Print response data for debugging

        // Check if all required fields are present in the response
        if (responseData.containsKey('txnToken') && responseData.containsKey('orderId') && responseData.containsKey('amount')) {
          var txnToken = responseData['txnToken'];
          var orderId = responseData['orderId'];
          var amount = responseData['amount'];
          var mid = '216820000000000077910';
          var callbackUrll = 'http://13.127.81.177:8000/callback/';
          var isStaging = false; // Set to true for staging environment

          // Use router SDK to initiate transaction
          var transactionResponse = await _initiateTransaction(txnToken, orderId, amount, mid, callbackUrll, isStaging);

          // Check if transactionResponse is not null and contains 'TXNID'
          if (transactionResponse != null && transactionResponse.containsKey('TXNID')) {
            print("Helloin if section");
            var txnDetails = {
              'BANKTXNID': transactionResponse['BANKTXNID'],
              'CHECKSUMHASH': transactionResponse['CHECKSUMHASH'],
              'CURRENCY': transactionResponse['CURRENCY'],
              'GATEWAYNAME': transactionResponse['GATEWAYNAME'],
              'MID': transactionResponse['MID'],
              'ORDERID': transactionResponse['ORDERID'],
              'PAYMENTMODE': transactionResponse['PAYMENTMODE'],
              'RESPCODE': transactionResponse['RESPCODE'],
              'RESPMSG': transactionResponse['RESPMSG'],
              'STATUS': transactionResponse['STATUS'],
              'TXNAMOUNT': transactionResponse['TXNAMOUNT'],
              'TXNDATE': transactionResponse['TXNDATE'],
              'TXNID': transactionResponse['TXNID']
            };

           print('Transaction successful! Transaction ID: ${transactionResponse['TXNID']}');

            // Post transaction response to callback URL
            await _postTransactionResponse(callbackUrll, txnDetails);
          } else {
           print('Error: Transaction failed or missing transaction ID in response');
          }
        } else {
         print('Error: Missing required data in response');
        }
      } else {
        // Request failed
        print(response.statusCode);
        print(response.body);
       print( 'Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Error occurred
      print( 'Error: $e');
    }
  }
  Future<void> _postTransactionResponse(String callbackUrll, Map<String, dynamic> response) async {
    try {
      // Making POST request to callback URL with transaction response data
      var callbackResponse = await http.post(
        Uri.parse(callbackUrll),
        body: json.encode(response),
        headers: {'Content-Type': 'application/json'},
      );

      // Checking response status
      if (callbackResponse.statusCode == 200) {

        print('Transaction response posted successfully');
        print(callbackResponse.statusCode);
        print(callbackResponse.body);
        // console.log(callbackResponse.body);

        // Redirect to CallbackScreen

      } else {
        print('Failed to post transaction response. Status code: ${callbackResponse.statusCode}');
      }
    } catch (e) {
      // Error occurred while posting transaction response
      print('Error posting transaction response: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Review & Verify Your Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  CircularPercentIndicator(
                    radius: screenHeight * 0.05,
                    lineWidth: 6,
                    percent: 0.95,
                    center: const Text(
                      '95%',
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    progressColor: Colors.green,
                    backgroundColor: Colors.grey.shade300,
                  ),
                  SizedBox(height: screenHeight * 0.0075),
                  Text(
                    _fullName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: screenHeight * 0.0075),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenWidth * 0.1),
                      border: Border.all(color: const Color(0xFFC1272D)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.01),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: const Color(0xFFC1272D),
                            size: screenWidth * 0.02,
                          ),
                          Text(
                            ' Not verified',
                            style: TextStyle(
                              color: const Color(0xFFC1272D),
                              fontSize: screenWidth * 0.02,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.0425),
            Container(
              height: 1,
              width: screenWidth * 0.9,
              color: Colors.grey,
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.02),
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      child: const Text(
                        'Contact Information',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    buildLabeledTextField(
                      context,
                      "Enrollment Number / Roll Number / College ID / UAN Number etc.",
                      "0105IT171125",
                      controller: _EnrollementNumberController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your enrollment number';
                        }
                        if (value.length < 10) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    buildLabeledTextField(
                      context,
                      "Interest Domain*",
                      "Domain",
                      keyboardType: TextInputType.text,
                      controller: _IntrestedDomainController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Domain';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      children: [
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFC1272D),
                          ),
                          child: TextButton(
                            onPressed: () {
                              if (_isAllFieldsValid()) {
                                //_saveFormDetails();
                                _makeTransactionRequest(amount);


                              } else {
                                setState(() {});
                              }
                            },
                            child: Text(
                              'Review & Next >',
                              style: TextStyle(
                                  fontSize: screenHeight * 0.015,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 70),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLabeledTextField(
      BuildContext context,
      String label,
      String hintText, {
        bool showPositionedBox = false,
        IconData? prefixIcon,
        bool obscureText = false,
        List<String>? dropdownItems,
        TextEditingController? controller,
        String? Function(String?)? validator,
        VoidCallback? onTap,
        TextInputType? keyboardType,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: label,
                  style: const TextStyle(color: Colors.black),
                ),
                const TextSpan(
                  text: " *",
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.0185),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04),
          child: dropdownItems != null
              ? DropdownButtonFormField<String>(
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            value: controller?.text.isNotEmpty == true
                ? controller?.text
                : null,
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
            isExpanded: true,
          )
              : TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
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
