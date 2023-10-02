import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwike/classes/custom_button.dart';
import 'package:kwike/screens/admin/auth/admin_login_screen.dart';
import 'package:kwike/screens/user/auth/login_screen.dart';

class StartUpScreen extends StatelessWidget {
  const StartUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              'assets/images/app_logo.PNG',
              height: 200,
              width: 200,
            )),
            CustomButton(
              buttonText: 'Login As User',
              onTap: () {
                Get.to(const LoginScreen());
              },
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              buttonText: 'Login As Admin',
              onTap: () {
                Get.to(const AdminLoginScreen());
              },
            )
          ],
        ),
      ),
    );
  }
}
