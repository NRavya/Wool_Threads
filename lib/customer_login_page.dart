import 'package:flutter/material.dart';
import 'package:wool_threads/customer_home_page.dart'; // Import the Customer home page
import 'package:wool_threads/integration/api_service.dart'; // Import ApiService
import 'package:wool_threads/integration/auth_service.dart'; // Import AuthService

class CustomerLoginPage extends StatefulWidget {
  const CustomerLoginPage({super.key});

  @override
  _CustomerLoginPageState createState() => _CustomerLoginPageState();
}

class _CustomerLoginPageState extends State<CustomerLoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiService apiService = ApiService(); // Instantiate ApiService
  final AuthService authService = AuthService(); // Instantiate AuthService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/background6.jpg'), // Customer-specific background
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: const Color(0xFFF7E7CE)
                .withOpacity(0.4), // Customer-specific color overlay
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
                      color: const Color(0xFFC19A6B), // Color for customer logo
                      colorBlendMode: BlendMode.srcIn,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 50),
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
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                            0xFFC19A6B), // Button color for customer
                      ),
                      onPressed: () async {
                        String email = _emailController.text;
                        String password = _passwordController.text;

                        try {
                          // Call the login function from ApiService
                          final response =
                              await apiService.login(email, password);

                          if (response != null && response['token'] != null) {
                            // Save the token using AuthService
                            await authService.saveToken(response['token']);

                            // Login successful, navigate to CustomerHomePage
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CustomerHomePage()),
                            );
                          } else {
                            // Login failed, show an error message
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Login Failed')),
                            );
                          }
                        } catch (e) {
                          // Handle any other errors (e.g., network issues)
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error: $e')),
                          );
                        }
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
