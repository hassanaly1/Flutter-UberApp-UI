import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwike/classes/custom_button.dart';
import 'package:kwike/classes/custom_text.dart';
import 'package:kwike/screens/admin/classes/admin_profile_screen.dart';
import 'package:kwike/screens/admin/classes/admin_register_screen.dart';

class AdminInfo extends StatefulWidget {
  const AdminInfo({super.key});

  @override
  State<AdminInfo> createState() => _AdminInfoState();
}

class _AdminInfoState extends State<AdminInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextWidget(
              text: 'Admin Info',
              fSize: 20,
              fWeight: FontWeight.w500,
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 80,
              child: GestureDetector(
                onTap: () => Get.to(
                  const AdminProfileScreen(),
                  transition: Transition.downToUp,
                ),
                child: Card(
                  color: Colors.grey[100],
                  elevation: 2,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          text: 'Mark Johnson',
                          fSize: 16,
                          fWeight: FontWeight.w500,
                        ),
                        CustomTextWidget(
                          text: 'Admin',
                          fSize: 16,
                          fWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.55),
            CustomButton(
              buttonText: 'Add Admin',
              onTap: () => Get.to(
                const AdminRegistrationScreen(),
                transition: Transition.downToUp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
