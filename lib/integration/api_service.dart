// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  // Base URL for the API
  final String _baseUrl =
      'http://localhost:5000/api'; // Replace with your API base URL
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  // Method to login and store the token
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login'), // Use _baseUrl here for the login endpoint
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      await _storage.write(
          key: 'token', value: responseData['token']); // Store token securely
      return responseData;
    } else {
      throw Exception('Failed to login');
    }
  }

  // Method to fetch market info
  Future<Map<String, dynamic>> fetchMarketInfo() async {
    final token = await _storage.read(key: 'token'); // Retrieve token
    final response = await http.get(
      Uri.parse(
          '$_baseUrl/market-info'), // Use _baseUrl for the market info endpoint
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // Include token in the request header
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch market info');
    }
  }

  // Method to fetch daily profits
  Future<Map<String, dynamic>> fetchDailyProfits() async {
    final token = await _storage.read(key: 'token'); // Retrieve token
    final response = await http.get(
      Uri.parse(
          '$_baseUrl/daily-profits'), // Use _baseUrl for the daily profits endpoint
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // Include token in the request header
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch daily profits');
    }
  }

  // Add other functions for different API requests as needed
}
