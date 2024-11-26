// customer_login_page.dart
import 'package:flutter/material.dart';
import 'package:wool_threads/customer_home_page.dart';
import 'farmer_home_page.dart'; // Import the Customer home page if different

class CustomerLoginPage extends StatefulWidget {
  @override
  _CustomerLoginPageState createState() => _CustomerLoginPageState();
}

class _CustomerLoginPageState extends State<CustomerLoginPage> {
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
                image: AssetImage('assets/background6.jpg'), // Customer-specific background
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Color(0xFFF7E7CE).withOpacity(0.4), // Customer-specific color overlay
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
                      'assets/yarn-ball-2.png',
                      color: Color(0xFFC19A6B), // Change this to any color you want
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
                        labelText: 'Customer Email',
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
                        backgroundColor: Color(0xFFC19A6B), // Customer-specific button color
                      ),
                      onPressed: () {
                        String email = _emailController.text;
                        String password = _passwordController.text;
                        print('Customer Email: $email');
                        print('Password: $password');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CustomerHomePage()), // Customer-specific home page
                        );
                      },
                      child: const Text(
                        'Login as Customer',
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
