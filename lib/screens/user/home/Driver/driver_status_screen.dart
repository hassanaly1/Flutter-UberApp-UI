import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwike/classes/custom_text.dart';
import 'package:kwike/screens/user/home/Driver/driver_homescreen.dart';
import 'package:kwike/screens/user/home/Driver/ride_screen.dart';

import 'package:timeline_tile/timeline_tile.dart';

class DriverStatusScreen extends StatefulWidget {
  const DriverStatusScreen({Key? key}) : super(key: key);

  @override
  _DriverStatusScreenState createState() => _DriverStatusScreenState();
}

class _DriverStatusScreenState extends State<DriverStatusScreen> {
  bool isDriverArrived = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                  borderRadius: BorderRadius.circular(10),
                ),
                height: Get.height * 0.3,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Timeline section
                      const SizedBox(height: 5),
                      const Text(
                        'Driver Status',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TimelineTile(
                        alignment: TimelineAlign.start,
                        indicatorStyle: IndicatorStyle(
                          width: 15,
                          color: isDriverArrived
                              ? Colors.white
                              : Colors.green, // Timeline color is green
                        ),
                        endChild: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          color: Colors.black,
                          child: CustomTextWidget(
                            text: 'Driver is on the way',
                            textColor:
                                isDriverArrived ? Colors.white : Colors.green,
                            fSize: 15,
                          ),
                        ),
                      ),
                      TimelineTile(
                        alignment: TimelineAlign.start,
                        indicatorStyle: IndicatorStyle(
                          width: 15,
                          color: isDriverArrived
                              ? Colors.green
                              : Colors.white, // Timeline color is green
                        ),
                        endChild: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          color: Colors.black,
                          child: CustomTextWidget(
                            text: 'Driver is arrived',
                            textColor:
                                isDriverArrived ? Colors.green : Colors.white,
                            fSize: 15,
                          ),
                        ),
                      ),
                      Center(
                        child: Visibility(
                          visible: isDriverArrived ? true : false,
                          child: ButtonWidget(
                            text: 'Start Ride',
                            color: Colors.green,
                            onTap: () {
                              Get.to(const RideScreen());
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
