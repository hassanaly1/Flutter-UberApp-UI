import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwike/classes/custom_text.dart';
import 'package:kwike/screens/user/home/User/kwike_feeds/card_widget.dart';
import 'package:kwike/screens/user/home/User/kwike_feeds/food_list.dart';

class KwikeFeedsScreen extends StatefulWidget {
  const KwikeFeedsScreen({super.key});

  @override
  State<KwikeFeedsScreen> createState() => _KwikeFeedsScreenState();
}

class _KwikeFeedsScreenState extends State<KwikeFeedsScreen> {
  final headings = [
    ['Fast Food', 'Get up to 25% off'],
    ['Pizza', 'Get up to 20% off'],
    ['Vegan', 'Get up to 5% off'],
    ['Mexican', 'Get up to 40% off'],
    ['Korean', 'Get up to 15% off'],
    ['Chinese', 'Get up to 10% off'],
    ['Italian', 'Get up to 35% off'],
    ['Asian', 'Get up to 15% off'],
    ['Deserts', 'Get up to 30% off'],
    ['Pasta', 'Get up to 10% off'],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const CustomTextWidget(
          text: 'Kwik-E Feeds',
          fSize: 20,
          fWeight: FontWeight.w700,
        ),
      ),
      body: GridView.builder(
        itemCount: headings.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return CardWidget(
              mainHeading: headings[index][0],
              subHeading: headings[index][1],
              // imageUrl: _imageURL[index],
              onTap: () {
                Get.to(const FoodList(), transition: Transition.downToUp);
              });
        },
      ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         CardWidget(
      //             text: 'Food Delivery',
      //             imageUrl: 'assets/images/food_delivery1.jpeg',
      //             onTap: () {
      //               Get.to(const FoodList(), transition: Transition.downToUp);
      //             }),
      //         CardWidget(
      //             text: 'KwikeMart',
      //             imageUrl: 'assets/images/pandamart.jpeg',
      //             onTap: () {})
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         CardWidget(
      //             text: 'Pick-up',
      //             imageUrl: 'assets/images/pickup.jpeg',
      //             onTap: () {}),
      //         CardWidget(
      //             text: 'Dine-in',
      //             imageUrl: 'assets/images/dinein.png',
      //             onTap: () {})
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
