import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kwike/classes/custom_text.dart';

class AdminDriverDetailScreen extends StatefulWidget {
  const AdminDriverDetailScreen({Key? key}) : super(key: key);

  @override
  State<AdminDriverDetailScreen> createState() => _AdminDriverDetailScreenState();
}

class _AdminDriverDetailScreenState extends State<AdminDriverDetailScreen> {
  List<DriverDetail> driverData = [
    DriverDetail(date: '10/2/23',fare: '\$200',rating: '4.8',totalRides: "15 Rides/D"),
    DriverDetail(date: '11/2/23',fare: '\$350',rating: '4.1',totalRides: "35 Rides/D"),
    DriverDetail(date: '12/2/23',fare: '\$50',rating: '4.2',totalRides: "5 Rides/D"),
    DriverDetail(date: '13/2/23',fare: '\$200',rating: '4.9',totalRides: "25 Rides/D"),
    DriverDetail(date: '14/2/23',fare: '\$150',rating: '4.0',totalRides: "12 Rides/D"),
    DriverDetail(date: '15/2/23',fare: '\$100',rating: '4.9',totalRides: "10 Rides/D"),
  ];
  @override
  Widget build(BuildContext context) {
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
                          CustomTextWidget(text: 'Barlin Jphn',fSize: 15,fWeight: FontWeight.w600,),
                          CustomTextWidget(text: 'uid2182983',),

                        ],
                      ),


                    ],
                  )
                ],
              ),

            ),
            CustomTextWidget(text: 'About',fSize: 17,fWeight: FontWeight.w500,),

            CustomTextWidget(text: 'Email: BarlinJph@gmail.com',),
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
                    itemCount: driverData.length,
                    itemBuilder: (BuildContext context,index)=> Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextWidget(text: '${driverData[index].date}'),
                            SizedBox(
                              width: 10,
                            ),

                            CustomTextWidget(text: '${driverData[index].fare}'),
                            SizedBox(
                              width: 20,
                            ),

                            CustomTextWidget(text: '${driverData[index].rating}'),
                            SizedBox(
                              width: 10,
                            ),
                            CustomTextWidget(text: '${driverData[index].totalRides}'),

                          ],
                        )

                      ],
                    )),
              ),
            ),
            Row(
              children: [
                CustomTextWidget(text: "Total Earn: ",fWeight: FontWeight.w600,fSize: 17,),
                CustomTextWidget(text: "\$2200",fSize: 16,),

              ],
            )

          ],
        ),
      ),
    );
  }
}
class DriverDetail {
  DriverDetail({this.totalRides, this.date, this.fare, this.rating});

  final String? totalRides;
  final String? date;
  final String? rating;
  final String? fare;
}