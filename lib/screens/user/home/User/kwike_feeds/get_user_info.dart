import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwike/classes/custom_button.dart';
import 'package:kwike/classes/custom_text.dart';
import 'package:kwike/screens/user/home/User/bottombar.dart';

class GetUserInfo extends StatefulWidget {
  const GetUserInfo({super.key});

  @override
  State<GetUserInfo> createState() => _GetUserInfoState();
}

class _GetUserInfoState extends State<GetUserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(
            text: 'Checkout', fSize: 20, fWeight: FontWeight.w700),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.shopping_bag_outlined,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              height: Get.height * 0.4,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.edit_location),
                          SizedBox(
                            width: 10,
                          ),
                          CustomTextWidget(
                            text: 'Delivery Address',
                            fSize: 18,
                            fWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                      Icon(Icons.edit)
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/google_map.png',
                      height: 50,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            const Divider(),
            SizedBox(
              height: Get.height * 0.3,
              child: Column(
                children: [
                  const Row(
                    children: [
                      Icon(Icons.summarize_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      CustomTextWidget(
                        text: 'Order Summary',
                        fSize: 18,
                        fWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(
                        text: '1x Burger',
                      ),
                      CustomTextWidget(
                        text: '\$12',
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(
                        text: '1x Pizza',
                        fSize: 15,
                        fWeight: FontWeight.w300,
                      ),
                      CustomTextWidget(
                        text: '\$15',
                        fSize: 15,
                        fWeight: FontWeight.w300,
                      )
                    ],
                  ),
                  const Divider(),
                  const CustomTextWidget(
                    text:
                        'By completing this order, I agree to all terms and conditions.',
                    fSize: 10,
                    fWeight: FontWeight.w400,
                  ),
                  const Spacer(),
                  CustomButton(
                    buttonText: 'Checkout',
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
                                    Get.to(const BottomBar(),
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
            )
          ],
        ),
      ),
    );
  }
}
