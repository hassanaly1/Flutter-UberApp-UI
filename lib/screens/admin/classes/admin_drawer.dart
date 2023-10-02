import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwike/classes/custom_text.dart';
import 'package:kwike/screens/admin/auth/admin_login_screen.dart';
import 'package:kwike/screens/admin/classes/admin_info.dart';
import 'package:kwike/screens/admin/payment/payment_screen.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: Get.height * 0.3,
            child: const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/user.png'),
                  ),
                  SizedBox(height: 10),
                  CustomTextWidget(
                    text: 'Admin',
                    textColor: Colors.white,
                    fSize: 18,
                  ),
                  SizedBox(height: 5),
                  CustomTextWidget(
                    text: 'admin@gmail.com',
                    textColor: Colors.white,
                    fSize: 15,
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              CustomAdminCard(
                text: 'Admin',
                icon: Icons.person,
                onTap: () => Get.to(
                  const AdminInfo(),
                  transition: Transition.downToUp,
                ),
              ),
              CustomAdminCard(
                text: 'Payment',
                icon: Icons.payments_rounded,
                onTap: () {
                  Get.to(const PaymentScreen(),
                      transition: Transition.downToUp);
                },
              ),
              CustomAdminCard(
                text: 'Users Management',
                icon: Icons.manage_accounts_rounded,
                onTap: () {},
              ),
              CustomAdminCard(
                text: 'Driver Management',
                icon: Icons.manage_accounts_rounded,
                onTap: () {},
              ),
              CustomAdminCard(
                text: 'Promotions',
                icon: Icons.discount_outlined,
                onTap: () {},
              ),
              CustomAdminCard(
                text: 'Settings',
                icon: Icons.settings_applications_sharp,
                onTap: () {},
              ),
              CustomAdminCard(
                text: 'Log Out',
                icon: Icons.logout_rounded,
                onTap: () => Get.offAll(const AdminLoginScreen(),
                    transition: Transition.leftToRight),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CustomAdminCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  const CustomAdminCard({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 2,
        child: ListTile(
          leading: Icon(icon),
          title: Text(text),
          onTap: onTap,
        ),
      ),
    );
  }
}
