import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "https://programmingkeeda.com/dcotor_app/api/";

  Future<Map<String, dynamic>> registerUser(
      Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse("${baseUrl}user_registration.php"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    return jsonDecode(response.body);
  }
}
