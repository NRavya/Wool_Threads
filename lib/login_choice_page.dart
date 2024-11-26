import 'package:flutter/material.dart';
import 'customer_login_page.dart'; // Import the customer login page
import 'farmer_login_page.dart';   // Import the farmer login page

class LoginChoicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/background4.jpg', // Replace with your background image path
              fit: BoxFit.cover,
           // Ensures the image covers the entire screen
            ),
          ),
          // Foreground Content
          //Container(
          //  color: Colors.purple[100]?.withOpacity(0.7),
          //),
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 20), // Add some space from the top
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0), // Add rounded edges
                    child: Image.asset(
                      'assets/image.png',
                      width: 275,
                      height: 275,
                      fit: BoxFit.cover, // Adjust the image fitting
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Choose Login Type',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Make text visible on the background
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Customer Box
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xFFF7E7CE).withOpacity(0.9),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                // Customer Image
                                Image.asset(
                                  'assets/knitting.png',
                                  color: Color(0xFFC19A6B),
                                  width: 100,
                                  height: 100,
                                ),
                                SizedBox(height: 10),
                                // Customer Button
                                ElevatedButton(
                                  child: Text(
                                    'Customer',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFC19A6B),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            CustomerLoginPage(),
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          const begin = Offset(1.0, 0.0);
                                          const end = Offset.zero;
                                          const curve = Curves.easeInOut;
                                          var tween =
                                              Tween(begin: begin, end: end)
                                                  .chain(
                                                      CurveTween(curve: curve));
                                          return SlideTransition(
                                            position: animation.drive(tween),
                                            child: child,
                                          );
                                        },
                                        transitionDuration:
                                            Duration(milliseconds: 500),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Farmer Box
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xFFa8c69f).withOpacity(0.9),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                // Farmer Image
                                Image.asset(
                                  'assets/sheep.png',
                                  color: Color(0xFF156064),
                                  width: 100,
                                  height: 100,
                                ),
                                SizedBox(height: 10),
                                // Farmer Button
                                ElevatedButton(
                                  child: Text(
                                    'Farmer',
                                    style: TextStyle(
                                        color: Color(0xFFa8c69f),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF156064),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            FarmerLoginPage(),
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          const begin = Offset(1.0, 0.0);
                                          const end = Offset.zero;
                                          const curve = Curves.easeInOut;
                                          var tween =
                                              Tween(begin: begin, end: end)
                                                  .chain(
                                                      CurveTween(curve: curve));
                                          return SlideTransition(
                                            position: animation.drive(tween),
                                            child: child,
                                          );
                                        },
                                        transitionDuration:
                                            Duration(milliseconds: 500),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
