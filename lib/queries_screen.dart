import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/Custom_alert_box.dart';

class QueriesScreen extends StatefulWidget {
  final bool isVerified;
  const QueriesScreen({Key? key, required this.isVerified}) : super(key: key);

  @override
  State<QueriesScreen> createState() => _QueriesScreenState();
}

class _QueriesScreenState extends State<QueriesScreen> {
  @override

void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Queries",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(screenHeight * 0.00),
                  child: Image.asset(
                    'images/At the office-pana.png',
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: RichText(
                      text: const TextSpan(
                        text: 'Full Name', // First part of the text
                        style: TextStyle(
                          color: Colors.black, // Style for the first part
                          fontSize: 12.0, // Adjusted font size
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' *', // Second part of the text
                            style: TextStyle(
                              color: Colors.red, // Style for the second part
                              fontSize: 12.0, // Adjusted font size
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0),
                    child: TextFormField(
                      style:
                          const TextStyle(fontSize: 12.0), // Adjusted font size
                      decoration: InputDecoration(
                        hintText: 'Full Name',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 8.0), // Adjust padding here
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: RichText(
                      text: const TextSpan(
                        text: 'Email Address', // First part of the text
                        style: TextStyle(
                          color: Colors.black, // Style for the first part
                          fontSize: 12.0, // Adjusted font size
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' *', // Second part of the text
                            style: TextStyle(
                              color: Colors.red, // Style for the second part
                              fontSize: 12.0, // Adjusted font size
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0),
                    child: TextFormField(
                      style:
                          const TextStyle(fontSize: 12.0), // Adjusted font size
                      decoration: InputDecoration(
                        hintText: 'Email Address',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 8.0), // Adjust padding here
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),

                  SizedBox(height: screenHeight * 0.01),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: RichText(
                      text: const TextSpan(
                        text: 'Query Type', // First part of the text
                        style: TextStyle(
                          color: Colors.black, // Style for the first part
                          fontSize: 12.0, // Adjusted font size
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' *', // Second part of the text
                            style: TextStyle(
                              color: Colors.red, // Style for the second part
                              fontSize: 12.0, // Adjusted font size
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0),
                    child: TextFormField(
                      style:
                          const TextStyle(fontSize: 12.0), // Adjusted font size
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.arrow_drop_down),
                        hintText: 'Career Problem',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 8.0), // Adjust padding here
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: RichText(
                      text: const TextSpan(
                        text: 'Discuss Your Problem (Optional)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0, // Adjusted font size
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0),
                    child: TextFormField(
                      maxLines: 3,
                      style:
                          const TextStyle(fontSize: 12.0), // Adjusted font size
                      decoration: InputDecoration(
                        hintText: 'Your Problem',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 8.0), // Adjust padding here
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (!widget.isVerified) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  contentPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  content: const CustomAlertbox());
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC1272D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Generate Query',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: screenHeight * 0.02), // Adjusted bottom space
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
