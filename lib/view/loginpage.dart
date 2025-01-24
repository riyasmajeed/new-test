import 'dart:developer';

import 'package:ecom/control/logincontroll.dart';
import 'package:ecom/view/home.dart';
import 'package:ecom/view/regiterpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController controller = Get.put(LoginController());








  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.centerLeft,
          colors: [Colors.black12, Colors.black],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 110),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Text(
                  'Welcome Back!',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  child: Column(
                    children: [
                      TextFormField(
                        controller:controller.usernameController,
                        decoration: const InputDecoration(
                          hintText: 'Username',
                          prefixIcon: Icon(Icons.person, color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                        ),
                        textInputAction: TextInputAction.next,
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: controller.passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: const Icon(Icons.lock, color: Colors.white),
                            suffixIcon: IconButton(
                                icon: Icon(
                                  controller.obscureText.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  controller.obscureText.toggle();
                                },
                              ),
                          hintStyle: const TextStyle(color: Colors.white),
                          border: const OutlineInputBorder(),

                        ),
                        textInputAction: TextInputAction.done,
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                       Obx(() => controller.isLoading.value
                          ? const CircularProgressIndicator(color: Colors.red)
                          : Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextButton(
                                onPressed: controller.login,
                                child: const Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )),
                      const SizedBox(height: 15),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Registerpage(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Register Now",
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
