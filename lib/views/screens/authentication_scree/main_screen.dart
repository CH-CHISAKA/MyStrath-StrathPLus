import 'package:flutter/material.dart';
import 'package:mystrath_strathplus/views/screens/authentication_scree/nav_screens/favouriite_screen.dart';
import 'package:mystrath_strathplus/views/screens/authentication_scree/nav_screens/home_screen.dart';
import 'package:mystrath_strathplus/views/screens/authentication_scree/nav_screens/menu_screen.dart';
import 'package:mystrath_strathplus/views/screens/authentication_scree/nav_screens/search_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const FavouriteScreen(),
    const SearchScreen(),
    const MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey[700],
        selectedItemColor: const Color.fromARGB(255, 221, 104, 14),
        currentIndex: _pageIndex,
        onTap: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/home.png"),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/favourite.png", width: 25),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/search.png", width: 25),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/menu.png", width: 25),
            label: 'Menu',
          ),
          // BottomNavigationBarItem(
          //   icon: Image.asset("assets/icons/profile.png", width: 25),
          //   label: 'Profile',
          // ),
        ],
      ),
      body: _pages[_pageIndex],
    );
  }
}
