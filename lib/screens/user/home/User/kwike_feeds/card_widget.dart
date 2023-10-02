import 'package:flutter/material.dart';
import 'package:kwike/classes/custom_text.dart';

class CardWidget extends StatelessWidget {
  final String mainHeading;
  final String subHeading;
  // final String imageUrl;
  final VoidCallback onTap;

  const CardWidget(
      {super.key,
      required this.onTap,
      required this.mainHeading,
      required this.subHeading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
          // decoration: const BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage('assets/images/food_delivery.jpeg'))),
          width: 170,
          height: 120,
          //color: Colors.grey[200],
          child: Card(
            color: const Color(0xffE5E4E2),
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CustomTextWidget(
                    text: mainHeading,
                    fSize: 18,
                    fWeight: FontWeight.w700,
                  ),
                ),
                Center(
                  child: CustomTextWidget(
                    text: subHeading,
                    fSize: 12,
                    fWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            // child: SvgPicture.asset(
            //   imageUrl,
            //   height: 50,
            //   width: 80,
            //   fit: BoxFit.fill,
            // ),
          ),
        ),
      ),
    );
  }
}
