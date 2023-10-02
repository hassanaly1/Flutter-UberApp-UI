import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwike/classes/custom_text.dart';
import 'package:kwike/screens/user/home/Driver/driver_status_screen.dart';
import 'package:kwike/screens/user/home/User/bottombar.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({Key? key}) : super(key: key);

  @override
  _DriverHomeScreenState createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  bool _isOnline = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver App'),
        leading: InkWell(
          onTap: () {
            drawerKey.currentState?.openDrawer();
          },
          child: const Icon(Icons.menu),
        ),
        actions: [
          Switch(
            activeColor: Colors.green,
            inactiveTrackColor: Colors.black,
            value: _isOnline,
            onChanged: (newValue) {
              setState(() {
                _isOnline = newValue;
              });
            },
          ),
        ],
      ),
      body: _isOnline ? const OnlineScreen() : const OfflineScreen(),
    );
  }
}

class OnlineScreen extends StatelessWidget {
  const OnlineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: Get.height,
          width: Get.width,
          child: Image.asset(
            'assets/images/google_map.png', // Replace with actual image path
            fit: BoxFit.cover,
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                height: Get.height * 0.3,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage('assets/images/user.png'),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                text: 'Andrew Smith',
                                textColor: Colors.white,
                                fSize: 18,
                                fWeight: FontWeight.w500,
                              ),
                              CustomTextWidget(
                                text: '3 km away | 12 mins',
                                textColor: Colors.white,
                                fSize: 15,
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.black,
                              ),
                              SizedBox(width: 5),
                              CustomTextWidget(
                                text: '4.5',
                                textColor: Colors.white,
                                fSize: 15,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: 'Pick Up from',
                            fSize: 14,
                            fWeight: FontWeight.w400,
                            textColor: Colors.white,
                          ),
                          CustomTextWidget(
                            text: '3039 Rose Avenue',
                            fSize: 14,
                            fWeight: FontWeight.w400,
                            textColor: Colors.white,
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonWidget(
                              text: 'Accept',
                              color: Colors.green,
                              onTap: () => Get.to(const DriverStatusScreen()),
                            ),
                            const SizedBox(width: 10),
                            ButtonWidget(
                              text: 'Decline',
                              color: Colors.red,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ))
      ],
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;
  final double height;
  final double width;

  const ButtonWidget({
    super.key,
    required this.text,
    required this.color,
    required this.onTap,
    this.height = 40,
    this.width = 120,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: color, // Set text color to white
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0), // Zero border radius
          ),
        ),
        child: Text(text),
      ),
    );
  }
}

class OfflineScreen extends StatelessWidget {
  const OfflineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Switch online to get driving orders"),
    );
  }
}
