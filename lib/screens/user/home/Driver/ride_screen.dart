import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwike/classes/custom_text.dart';
import 'package:kwike/screens/user/home/Driver/driver_homescreen.dart';
import 'package:kwike/screens/user/home/Driver/fare_screen.dart';

class RideScreen extends StatefulWidget {
  const RideScreen({Key? key}) : super(key: key);

  @override
  _RideScreenState createState() => _RideScreenState();
}

class _RideScreenState extends State<RideScreen> {
  bool isDestinationArrived = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Image.asset(
              'assets/images/ride.PNG', // Replace with actual image path
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
                height: Get.height * 0.15,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.arrow_upward_outlined,
                            color: Colors.white,
                          ),
                          CustomTextWidget(
                            text: '2 hr 3 min',
                            fSize: 16,
                            textColor: Colors.white,
                            fWeight: FontWeight.bold,
                          ),
                          CustomTextWidget(
                            text: '126mi - 1:55 PM',
                            fSize: 16,
                            textColor: Colors.white,
                            fWeight: FontWeight.bold,
                          )
                        ],
                      ),
                      Center(
                        child: Visibility(
                          visible: isDestinationArrived ? true : false,
                          child: ButtonWidget(
                            text: 'Arrived',
                            color: Colors.green,
                            height: 40,
                            width: 100,
                            onTap: () {
                              Get.to(const FareCollectionScreen());
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
