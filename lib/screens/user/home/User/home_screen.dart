import 'package:flutter/material.dart';
import 'package:kwike/classes/custom_address_widget.dart';
import 'package:kwike/classes/custom_search_bar.dart';
import 'package:kwike/classes/custom_text.dart';
import 'package:kwike/classes/finalize_payment.dart';
import 'package:kwike/classes/horizontal_listview.dart';
import 'package:kwike/classes/suggestions_and_see_all.dart';
import 'package:kwike/classes/suggestions_boxes.dart';
import 'package:kwike/screens/user/home/User/bottombar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const CustomTextWidget(
            text: 'Kwik-E',
            fSize: 20,
            fWeight: FontWeight.w700,
          ),
          leading: InkWell(
            onTap: () {
              drawerKey.currentState?.openDrawer();
            },
            child: const Icon(Icons.menu),
          ),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              CustomSearchBar(),
              CustomAddressWidget(),
              CustomAddressWidget(),
              FinalizePayment(),
              SuggestionsAndSeeAll(),
              SuggestionBoxes(),
              HorizontalListView(),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
