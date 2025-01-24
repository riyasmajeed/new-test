import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;
  var obscureText = true.obs;

  Future<void> login() async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    if (!_validateInputs(username, password)) {
      Get.snackbar("Input Error", "Username and password are required, and the password must be at least 6 characters.");
      return;
    }

    isLoading.value = true;

    try {
      final response = await _authenticateUser(username, password);

      if (response != null && response["token"] != null) {
        await _storeToken(response["token"]);
        Get.snackbar("Success", "Login Successful!");
        // Get.offAllNamed(AppRoutes.home);
      } else {
        Get.snackbar("Login Failed", "Invalid username or password. Please try again.");
      }
    } catch (e) {
      Get.snackbar("Network Error", "Failed to connect to the server.");
    } finally {
      isLoading.value = false;
    }
  }

  Future<Map<String, dynamic>?> _authenticateUser(String username, String password) async {
    final url = Uri.parse("https://dummyjson.com/auth/login");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({"username": username, "password": password}),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null;
  }

  Future<void> _storeToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt_token', token);
  }

  bool _validateInputs(String username, String password) {
    return username.isNotEmpty && password.isNotEmpty && password.length >= 6;
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
