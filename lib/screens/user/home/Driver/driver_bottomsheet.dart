import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwike/screens/startup_screen.dart';
import 'package:kwike/screens/user/account/account_screen.dart';
import 'package:kwike/screens/user/history/activity_screen.dart';
import 'package:kwike/screens/user/home/Driver/driver_homescreen.dart';
import 'package:kwike/screens/user/home/User/bottombar.dart';

class DriverBottomBar extends StatefulWidget {
  const DriverBottomBar({super.key});

  @override
  State<DriverBottomBar> createState() => _DriverBottomBarState();
}

class _DriverBottomBarState extends State<DriverBottomBar> {
  int _selectedIndex = 0;
  late List<Widget> _widgetOptions;
  late List<BottomNavigationBarItem> _bottomNavBarItems;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    driverBottomBar();
  }

  driverBottomBar() {
    _widgetOptions = <Widget>[
      const DriverHomeScreen(),
      const ActivityScreen(),
      const AccountScreen(),
    ];
    _bottomNavBarItems = [
      const BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.home,
            color: Colors.black26,
          ),
          activeIcon: Icon(
            CupertinoIcons.home,
            color: Colors.black,
          ),
          label: ''),
      const BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.calendar,
            color: Colors.black26,
          ),
          activeIcon: Icon(
            CupertinoIcons.calendar,
            color: Colors.black,
          ),
          label: ''),
      const BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.person,
            color: Colors.black26,
          ),
          activeIcon: Icon(
            CupertinoIcons.person,
            color: Colors.black,
          ),
          label: ''),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/user.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'John Smith',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                elevation: 2,
                child: ListTile(
                  leading: const Icon(Icons.person_2_rounded),
                  // ignore: dead_code
                  title: const Text('User Mode'),
                  onTap: () {
                    Get.to(const BottomBar());
                    drawerKey.currentState?.closeDrawer();
                  },
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.55),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Card(
                elevation: 2,
                child: ListTile(
                  leading: const Icon(Icons.logout_outlined),
                  title: const Text('Log Out'),
                  onTap: () {
                    Get.offAll(const StartUpScreen());
                  },
                ),
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blueGrey,
        type: BottomNavigationBarType.fixed,
        items: _bottomNavBarItems,
      ),
    );
  }
}
