import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwike/classes/custom_button.dart';
import 'package:kwike/classes/custom_text.dart';
import 'package:kwike/screens/user/home/Driver/driver_bottomsheet.dart';

import 'package:timeline_tile/timeline_tile.dart';

class FareCollectionScreen extends StatelessWidget {
// Replace with actual fare amount

  const FareCollectionScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fare Collection'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimelineTile(
                alignment: TimelineAlign.start,
                indicatorStyle: const IndicatorStyle(
                  width: 15,
                  color: Colors.black, // Timeline color is green
                ),
                endChild: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: Colors.white,
                  child: const CustomTextWidget(
                    text: '3089 Timber Oak Drive',
                    textColor: Colors.black,
                    fSize: 15,
                  ),
                ),
              ),
              TimelineTile(
                alignment: TimelineAlign.start,
                indicatorStyle:
                    const IndicatorStyle(width: 15, color: Colors.black
                        // Timeline color is green
                        ),
                endChild: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: Colors.white,
                  child: const CustomTextWidget(
                    text: '1874 Heather Sees Way',
                    textColor: Colors.black,
                    fSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Total Fare Amount:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const CustomTextWidget(
                text: '\$120', // Display the fare amount
                fSize: 24, fWeight: FontWeight.bold,
              ),
              const SizedBox(height: 20),
              CustomButton(
                buttonText: 'Collect Payment',
                //ToDo: Payment Screen.
                onTap: () {
                  showDialog(
                    context:
                        context, // You should have access to the context in your widget tree
                    builder: (context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            // Animated icons
                            const AnimatedSwitcher(
                              duration: Duration(milliseconds: 500),
                              child: CircleAvatar(
                                backgroundColor: Colors.green,
                                child: Icon(Icons.check,
                                    key: ValueKey<int>(2),
                                    size: 40,
                                    color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const CustomTextWidget(
                                text: 'Thanks for using Kwike.'),
                            const SizedBox(height: 16),
                            CustomButton(
                              buttonText: 'Back to Home Screen',
                              onTap: () {
                                Get.to(const DriverBottomBar(),
                                    transition: Transition.downToUp);
                              },
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
