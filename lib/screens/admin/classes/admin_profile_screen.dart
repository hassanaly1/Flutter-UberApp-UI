import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwike/classes/app_assets.dart';
import 'package:kwike/classes/custom_button.dart';
import 'package:kwike/classes/custom_text.dart';

class AdminProfileScreen extends StatelessWidget {
  const AdminProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextWidget(
              text: 'Account Info',
              fSize: 20,
              fWeight: FontWeight.bold,
            ),
            const SizedBox(height: 10),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/user.png'),
            ),
            const SizedBox(height: 10),
            const CustomTextWidget(
              text: 'Basic Info',
              fSize: 20,
              fWeight: FontWeight.w500,
            ),
            ReUsableAccountInfoWidget(
                infoType: 'Name', infoValue: 'Admin', onTap: () {}),
            ReUsableAccountInfoWidget(
              infoType: 'Email',
              infoValue: 'admin@gmail.com',
              onTap: () {},
            ),
            const SizedBox(height: 20),
            CustomButton(
              buttonText: 'Update',
              onTap: () => Get.back(),
            )
          ],
        ),
      ),
    );
  }
}

class ReUsableAccountInfoWidget extends StatelessWidget {
  final String infoType;
  final String infoValue;
  final VoidCallback onTap;
  const ReUsableAccountInfoWidget({
    Key? key,
    required this.infoType,
    required this.infoValue,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              infoType,
              style: const TextStyle(
                color: AppAssets.textColor,
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: infoValue,
                        hintStyle: const TextStyle(color: Colors.black87),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
