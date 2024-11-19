// farmer_login_page.dart
import 'package:flutter/material.dart';
import 'farmer_home_page.dart'; // Import the Farmer home page if different

class FarmerLoginPage extends StatefulWidget {
  @override
  _FarmerLoginPageState createState() => _FarmerLoginPageState();
}

class _FarmerLoginPageState extends State<FarmerLoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background2.jpeg'), // Farmer-specific background
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.green.withOpacity(0.7), // Farmer-specific color overlay
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      'assets/black_sheep.png',
                      color: Colors.yellow[100], // Change this to any color you want
                      colorBlendMode: BlendMode.srcIn, // Farmer-specific logo
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Farmer Email',
                        fillColor: Colors.white.withOpacity(0.8),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        fillColor: Colors.white.withOpacity(0.8),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Farmer-specific button color
                      ),
                      onPressed: () {
                        String email = _emailController.text;
                        String password = _passwordController.text;
                        print('Farmer Email / Phone Number: $email');
                        print('Password: $password');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FarmerHomePage()), // Farmer-specific home page
                        );
                      },
                      child: const Text(
                        'Login as Farmer',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
