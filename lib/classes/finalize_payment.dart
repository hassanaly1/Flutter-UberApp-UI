import 'package:flutter/material.dart';
import 'package:kwike/classes/app_assets.dart';
import 'package:kwike/classes/custom_text.dart';

class FinalizePayment extends StatelessWidget {
  const FinalizePayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        color: Colors.grey[200],
        elevation: 4, // Add elevation for a card-like appearance
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        child: Container(
          height: 115, // Set the height of the card
          width: double.infinity, // Cover the whole width of the screen
          padding: const EdgeInsets.all(16), // Add padding for content
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(
                text: 'Finalize Payment',
                fWeight: FontWeight.bold,
                fSize: 18,
              ),
              CustomTextWidget(
                text: '₹170.71rrr',
                fWeight: FontWeight.bold,
                fSize: 20,
              ),
              Row(
                children: [
                  CustomTextWidget(
                    text: 'Pay',
                    fWeight: FontWeight.bold,
                    fSize: 18,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: AppAssets.textColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
