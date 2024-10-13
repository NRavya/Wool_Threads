// login_page.dart
import 'package:flutter/material.dart';
import 'home_page.dart'; // Import the home page

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background2.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Color overlay with opacity
          Container(
            color: Colors.blue.withOpacity(0.75),
          ),
          // Main content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0), // Horizontal padding for the whole content
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Logo with custom spacing
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      'assets/image.png',
                      width: 300,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 50), // Space below the logo
                  
                  // Email field
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0), // Padding above and below the email field
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        fillColor: Colors.white.withOpacity(0.8),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  
                  // Password field
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0), // Padding above and below the password field
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
                  
                  // Login button with custom spacing
                  SizedBox(height: 30), // Space above the button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        String email = _emailController.text;
                        String password = _passwordController.text;
                        print('Email: $email');
                        print('Password: $password');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFEFEFE),
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
