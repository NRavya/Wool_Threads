import 'package:flutter/material.dart';
import 'farmer_home_page.dart'; // Import the Farmer home page if different
import 'package:wool_threads/integration/api_service.dart'; // Import your ApiService

class FarmerLoginPage extends StatefulWidget {
  @override
  _FarmerLoginPageState createState() => _FarmerLoginPageState();
}

class _FarmerLoginPageState extends State<FarmerLoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final ApiService apiService = ApiService(); // Instantiate ApiService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background5.jpg'), // Path to your background image
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.blue.withOpacity(0.4),
                  BlendMode.darken,
                ),
              ),
            ),
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
                      color: Color(0xFFa8c69f),
                      colorBlendMode: BlendMode.srcIn,
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
                        fillColor: Colors.white.withOpacity(0.9),
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
                        fillColor: Colors.white.withOpacity(0.9),
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
                        backgroundColor:
                            Colors.blue.withOpacity(0.9), // Farmer-specific button color
                      ),
                      onPressed: () async {
                        String email = _emailController.text;
                        String password = _passwordController.text;

                        // Call the login function from ApiService
                        Map<String, dynamic> response = await apiService.login(email, password);
                        String? token = response['token'];

                        if (token != null) {
                          // Login successful, navigate to FarmerHomePage
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => FarmerHomePage()),
                          );
                        } else {
                          // Login failed, show an error message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Login Failed')),
                          );
                        }
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
