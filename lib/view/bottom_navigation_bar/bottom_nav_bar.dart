import 'package:flutter/material.dart';
import 'package:fluxstore/themecolor/themecolor.dart';
import 'package:fluxstore/view/screens/account_screen/account_screen.dart';
import 'package:fluxstore/view/screens/home_screen/home_screen.dart';
import 'package:fluxstore/view/screens/search_screen/search_screen.dart';
import 'package:fluxstore/view/screens/shopping_screen/shopping_screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    SearchScreen(),
    ShoppingScreen(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: SizedBox(
            height: 70,
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              selectedItemColor: themeprimarycolor,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              iconSize: 25, // icons ka size badhao
              selectedLabelStyle: const TextStyle(
                fontSize: 16,
              ), // selected text bada
              unselectedLabelStyle: const TextStyle(
                fontSize: 14,
              ), // unselected text bada
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag),
                  label: 'Shopping',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Account',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
