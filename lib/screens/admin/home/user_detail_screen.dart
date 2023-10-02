import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kwike/classes/custom_text.dart';

class AdminUserDetailScreen extends StatelessWidget {
  const AdminUserDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<UserDetail> userData = [
      UserDetail(date: '10/2/23',fare: '\$20',from: 'Jasmin Market, New York',to: 'b21 street, New York',rating: '4.8'),
      UserDetail(date: '23/2/23',fare: '\$37',from: 'jh Nore, New York',to: 'b21 street, New York',rating: '5.0'),
      UserDetail(date: '01/3/23',fare: '\$20',from: 'Cloth Market, New York',to: 'b21 street, New York',rating: '3.5'),
      UserDetail(date: '29/3/23',fare: '\$20',from: 'knw area, New York',to: 'b21 street, New York',rating: '4.0'),
      UserDetail(date: '29/3/23',fare: '\$20',from: 'blue wor, New York',to: 'b21 street, New York',rating: '2.8'),
      UserDetail(date: '09/4/23',fare: '\$20',from: 'Jasmin Market, New York',to: 'b21 street, New York',rating: '2.5'),
      UserDetail(date: '10/4/23',fare: '\$20',from: 'b21 street, New York',to: 'b21 street, New York',rating: '4.1'),

    ];
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(text: 'User Information',fWeight: FontWeight.w600,fSize: 17),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.17,
              width: Get.width,
              padding: EdgeInsets.all(12),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                          height:Get.height * 0.1,
                          width: Get.width * 0.15,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey
                          ),
                          child: SvgPicture.asset('assets/images/dummy-image.svg',)),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(text: 'Kenye',fSize: 15,fWeight: FontWeight.w600,),
                          CustomTextWidget(text: 'uid2182983',),

                        ],
                      ),


                    ],
                  )
                ],
              ),

            ),
            CustomTextWidget(text: 'About',fSize: 17,fWeight: FontWeight.w500,),

            CustomTextWidget(text: 'Email: Kenya@gmail.com',),
            CustomTextWidget(text: 'Ph#:   +923XXXXXXXXX',),
            CustomTextWidget(text: 'Location: B2 Street - New York',),

SizedBox(
  height: 10,
),
            CustomTextWidget(text: 'Last month trips history',fSize: 17,fWeight: FontWeight.w500,),

            Expanded(
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
                ),
                child: ListView.builder(
                    itemCount: userData.length,
                    itemBuilder: (BuildContext context,index)=> Column(
                  children: [
                    Row(
                      children: [
                        CustomTextWidget(text: '${userData[index].date}'),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(child: CustomTextWidget(text: '${userData[index].from} ')),

                        Expanded(child: CustomTextWidget(text: '${userData[index].to}')),
                        SizedBox(
                          width: 10,
                        ),
                        CustomTextWidget(text: '${userData[index].fare}'),
                        SizedBox(
                          width: 20,
                        ),

                        CustomTextWidget(text: '${userData[index].rating}'),

                      ],
                    )

                  ],
                )),
              ),
            ),
            Row(
              children: [
                CustomTextWidget(text: "Total Spend: ",fWeight: FontWeight.w600,fSize: 17,),
                CustomTextWidget(text: "\$220",fSize: 16,),

              ],
            )

          ],
        ),
      ),
    );
  }
}
class UserDetail {
  UserDetail({this.to, this.date, this.fare, this.from, this.rating});

  final String? from;
  final String? to;
  final String? date;
  final String? rating;
  final String? fare;
}