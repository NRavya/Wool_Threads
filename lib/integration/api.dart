import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  static const String baseUrl =
      "http://localhost:5000/api"; // Replace with your backend URL
  final storage = const FlutterSecureStorage();

  // Login Function
  Future<String?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await storage.write(key: "token", value: data['token']);
      return data['token'];
    } else {
      return null;
    }
  }

  // Fetch Splash Screen Data
  Future<Map<String, dynamic>?> fetchSplashData() async {
    final response = await http.get(Uri.parse("$baseUrl/splash"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }

  // Fetch Market Info
  Future<Map<String, dynamic>?> fetchMarketInfo() async {
    final token = await storage.read(key: "token");
    final response = await http.get(
      Uri.parse("$baseUrl/market-info"),
      headers: {"Authorization": "Bearer $token"},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }
}
