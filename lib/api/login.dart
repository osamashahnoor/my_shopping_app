import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_shopping_app/model/loginmodel.dart';

Future<String> loginToApi(String username, String password) async {
  const String url = "https://fakestoreapi.com/auth/login";

  final loginRequest = LoginRequest(username: username, password: password);

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(loginRequest.toJson()),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final loginResponse = LoginResponse.fromJson(data);

      return "Login successful! Token: ${loginResponse.token}";
    } else {
      return "Login failed! ${response.body}";
    }
  } catch (e) {
    return "An error occurred: $e";
  }
}
