import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../style/colors.dart';
import 'countries_screen.dart';
import 'profile_screen.dart';
import 'services_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 2;

  List widgetOptions = const [
    Text('Who Am I'),
    Text('Countries'),
    Text('Services'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: selectedIndex == 0
            ? const ProfileScreen()
            : selectedIndex == 1
                ? const CountriesScreen()
                : const ServicesScreen(),
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/usercircle.png',
              color: selectedIndex == 0 ? mainColor : Colors.grey,
            ),
            label: 'Who Am I',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/earth.png',
              color: selectedIndex == 1 ? mainColor : null,
            ),
            label: 'Countries',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/shoppingcart.png',
              color: selectedIndex == 2 ? mainColor : null,
            ),
            label: 'Services',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: mainColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
