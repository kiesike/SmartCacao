import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // For Chrome (Web)
  static const String baseUrl = "http://localhost:9000/api";

  // For Android Emulator, use this instead:
  // static const String baseUrl = "http://10.0.2.2:9000/api";

  static Future<String> testConnection() async {
    final response = await http.get(Uri.parse("$baseUrl/test"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['message'];
    } else {
      throw Exception("Failed to connect to API");
    }
  }
}