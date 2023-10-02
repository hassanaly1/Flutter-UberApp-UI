import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwike/classes/custom_text.dart';
import 'package:kwike/screens/user/home/User/kwike_feeds/cart_screen.dart';
import 'package:kwike/screens/user/home/User/kwike_feeds/food_item.dart';
import 'package:kwike/screens/user/home/User/kwike_feeds/foodlist_modal.dart';

class FoodList extends StatefulWidget {
  const FoodList({super.key});

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  final _itemsList = [
    [
      "Burgers",
      "assets/images/burgers.jpg",
      "\$10",
      "It offer a Meal Deal that includes a burger, fries, and a drink for a lower price than if these items were purchased separately. Another popular deal is the Extra Value Meal, which includes a burger, fries, and a drink, as well as an additional menu item such as chicken nuggets or a salad."
    ],
    [
      "Desert",
      "assets/images/delizia.PNG",
      "\$20",
      "It includes a offer of Meal Deal that includes a burger, fries, and a drink for a lower price than if these items were purchased separately. Another popular deal is the Extra Value Meal, which includes a burger, fries, and a drink, as well as an additional menu item such as chicken nuggets or a salad.s"
    ],
    [
      'Waffles',
      'assets/images/kababjees.jpg',
      "\$18",
      'It includes a offer of Meal Deal that includes a burger, fries, and a drink for a lower price than if these items were purchased separately. Another popular deal is the Extra Value Meal, which includes a burger, fries, and a drink, as well as an additional menu item such as chicken nuggets or a salad.'
    ],
    [
      "Nuggets",
      "assets/images/optp.PNG",
      "\$15",
      "It includes a offer of Meal Deal that includes a burger, fries, and a drink for a lower price than if these items were purchased separately. Another popular deal is the Extra Value Meal, which includes a burger, fries, and a drink, as well as an additional menu item such as chicken nuggets or a salad."
    ],
    [
      "Pizza",
      "assets/images/broadway.PNG",
      "\$12",
      "It includes a offer of Meal Deal that includes a burger, fries, and a drink for a lower price than if these items were purchased separately. Another popular deal is the Extra Value Meal, which includes a burger, fries, and a drink, as well as an additional menu item such as chicken nuggets or a salad."
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(
            text: 'Kwik-E Feeds', fSize: 20, fWeight: FontWeight.w700),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () =>
                    Get.to(const CartScreen(), transition: Transition.upToDown),
                child: const Icon(
                  Icons.shopping_bag_outlined,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: _itemsList.length,
                itemBuilder: (context, index) {
                  return FoodItem(
                    text: _itemsList[index][0],
                    imageUrl: _itemsList[index][1],
                    price: _itemsList[index][2],
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                        builder: (context) {
                          return FoodListModal(
                              text: _itemsList[index][0],
                              price: _itemsList[index][2],
                              imageUrl: _itemsList[index][1],
                              description: _itemsList[index][3],
                              onPressed: () {});
                        },
                      );
                    },
                  );
                },
              )

              // Expanded(
              //   child: Consumer<CartModal>(
              //     builder: (context, value, child) {
              //       return ListView.builder(
              //         itemCount: value.itemsList.length,
              //         itemBuilder: (context, index) {
              //           return FoodItem(
              //             text: value.itemsList[index][0],
              //             imageUrl: value.itemsList[index][1],
              //             price: value.itemsList[index][2],
              //             onTap: () {
              //               showModalBottomSheet(
              //                 context: context,
              //                 shape: const RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.only(
              //                   topLeft: Radius.circular(20),
              //                   topRight: Radius.circular(20),
              //                 )),
              //                 builder: (context) {
              //                   return FoodListModal(
              //                       text: value.itemsList[index][0],
              //                       price: value.itemsList[index][2],
              //                       imageUrl: value.itemsList[index][1],
              //                       description: value.itemsList[index][3],
              //                       onPressed: () {
              //                         // Provider.of<CartModal>(context, listen: false)
              //                         //     .addItemToCart(index);
              //                       });
              //                 },
              //               );
              //             },
              //           );
              //         },
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // buildSheet() => Container();
}

            // FoodItem(
            //   text: 'McDonalds',
            //   imageUrl: 'assets/images/burgers.jpg',
            //   onTap: () {
            //     showModalBottomSheet(
            //       context: context,
            //       shape: const RoundedRectangleBorder(
            //           borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(20),
            //         topRight: Radius.circular(20),
            //       )),
            //       builder: (context) {
            //         return const FoodListModal(
            //             text: 'McDonalds',
            //             price: '699',
            //             imageUrl: 'assets/images/burgers.jpg',
            //             description: '');
            //       },
            //     );
            //   },
            //   price: '699',
            // ),