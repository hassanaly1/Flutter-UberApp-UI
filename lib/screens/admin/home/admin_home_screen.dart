import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kwike/classes/app_assets.dart';
import 'package:kwike/classes/custom_text.dart';
import 'package:kwike/screens/admin/classes/admin_drawer.dart';
import 'package:kwike/screens/admin/home/driver_detail_screen.dart';
import 'package:kwike/screens/admin/home/user_detail_screen.dart';

import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  Map<String, double> dataMap = {
    "Driver": 3,
    "User": 7,
  };
  List<_SalesData> data = [
    _SalesData('Jan', 58),
    _SalesData('Feb', 115),
    _SalesData('Mar', 220),
    _SalesData('Apr', 90),
    _SalesData('May', 140)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AdminDrawer(),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: Get.height * 0.2,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      // title: const Text("Collapsing Toolbar",
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 16.0,
                      //     )),
                      background: Image.asset(
                        'assets/images/app_logo.PNG',
                        fit: BoxFit.fill,
                      )),
                ),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    const TabBar(
                      indicatorColor: Colors.black,
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                          text: 'Dashboard',
                        ),
                        Tab(text: "Users"),
                        Tab(text: "Drivers"),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                Dashboard(),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 4.0, bottom: 4, left: 8, right: 8),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => const AdminUserDetailScreen());
                          },
                          child: Container(
                            height: Get.height * 0.17,
                            width: Get.width,
                            padding: const EdgeInsets.all(12),
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
                                        height: Get.height * 0.1,
                                        width: Get.width * 0.15,
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.grey),
                                        child: SvgPicture.asset(
                                          'assets/images/dummy-image.svg',
                                        )),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomTextWidget(
                                          text: 'Kenye',
                                          fSize: 15,
                                          fWeight: FontWeight.w600,
                                        ),
                                        CustomTextWidget(
                                          text: 'Rating 3.5',
                                        ),
                                        CustomTextWidget(
                                          text: 'Spend: \$220.49',
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    const Icon(Icons.navigate_next)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 4.0, bottom: 4, left: 8, right: 8),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => const AdminDriverDetailScreen());
                          },
                          child: Container(
                            height: Get.height * 0.17,
                            width: Get.width,
                            padding: const EdgeInsets.all(12),
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
                                        height: Get.height * 0.1,
                                        width: Get.width * 0.15,
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.black12),
                                        child: SvgPicture.asset(
                                          'assets/images/dummy-image.svg',
                                        )),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomTextWidget(
                                          text: 'Barlin Jphn',
                                          fSize: 15,
                                          fWeight: FontWeight.w600,
                                        ),
                                        CustomTextWidget(
                                          text: 'Rating 4.8',
                                        ),
                                        CustomTextWidget(
                                          text: 'Earning: \$5400.00',
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    const Icon(Icons.navigate_next)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            )),
      ),
    );
  }

  Widget Dashboard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black),
                  child: const Column(
                    children: [
                      CustomTextWidget(
                        text: '220',
                        fWeight: FontWeight.w600,
                        fSize: 19,
                        textColor: Colors.white,
                      ),
                      CustomTextWidget(
                        text: 'Complete Trips',
                        textColor: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black),
                  child: const Column(
                    children: [
                      CustomTextWidget(
                        text: '\$9247.03',
                        fWeight: FontWeight.w600,
                        fSize: 19,
                        textColor: Colors.white,
                      ),
                      CustomTextWidget(
                        text: 'Total Balance',
                        textColor: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black),
                  child: const Column(
                    children: [
                      CustomTextWidget(
                        text: '30',
                        fWeight: FontWeight.w600,
                        fSize: 19,
                        textColor: Colors.white,
                      ),
                      CustomTextWidget(
                        text: 'Cancel Trip',
                        textColor: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomTextWidget(
              text: "Last month new registrations chart",
              fSize: 18,
              fWeight: FontWeight.w600),
          const SizedBox(
            height: 10,
          ),
          peiChart(),
          const SizedBox(
            height: 20,
          ),
          const CustomTextWidget(
              text: "Most requested", fSize: 18, fWeight: FontWeight.w600),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // Chart title
                //   title: ChartTitle(text: 'Half yearly sales analysis'),
                // Enable legend
                //  legend: Legend(isVisible: true),
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_SalesData, String>>[
                  LineSeries<_SalesData, String>(
                      dataSource: data,
                      xValueMapper: (_SalesData sales, _) => sales.year,
                      yValueMapper: (_SalesData sales, _) => sales.sales,
                      name: '',
                      // Enable data label
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: true))
                ]),
          ),
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     //Initialize the spark charts widget
          //     child: SfSparkLineChart.custom(
          //       //Enable the trackball
          //       trackball: SparkChartTrackball(
          //           activationMode: SparkChartActivationMode.tap),
          //       //Enable marker
          //       marker: SparkChartMarker(
          //           displayMode: SparkChartMarkerDisplayMode.all),
          //       //Enable data label
          //       labelDisplayMode: SparkChartLabelDisplayMode.all,
          //       xValueMapper: (int index) => data[index].year,
          //       yValueMapper: (int index) => data[index].sales,
          //       dataCount: 5,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  Widget peiChart() {
    return PieChart(
      dataMap: dataMap,
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      colorList: const [
        Colors.grey,
        Colors.black,
      ],
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 20,
      totalValue: 10,

      legendOptions: const LegendOptions(
        showLegendsInRow: true,
        //legendPosition: LegendPosition.right,
        showLegends: true,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: const ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: false,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
      // gradientList: ---To add gradient colors---
      // emptyColorGradient: ---Empty Color gradient---
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppAssets.backgroundColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
