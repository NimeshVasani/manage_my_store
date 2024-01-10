import 'package:flutter/material.dart';

import 'homescreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  static const List<Widget> _bottomNavScreens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop:false,
      child: Scaffold(
        extendBody: true,
        body: Center(child: _bottomNavScreens.elementAt(selectedIndex)),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: Container(
              height: 80,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Colors.black),
              child: BottomNavigationBar(
                unselectedItemColor: Colors.white60,
                selectedItemColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                currentIndex: selectedIndex,
                onTap: (int index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined,
                        color: Colors.white.withOpacity(0.5)),
                    activeIcon:
                        const Icon(Icons.home_outlined, color: Colors.white),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.credit_card_rounded,
                        color: Colors.white.withOpacity(0.5)),
                    activeIcon: const Icon(Icons.credit_card_rounded,
                        color: Colors.white),
                    label: "Accounts",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.money, color: Colors.white.withOpacity(0.5)),
                    activeIcon: const Icon(Icons.money, color: Colors.white),
                    label: "Move Money",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.grid_view_outlined,
                        color: Colors.white.withOpacity(0.5)),
                    activeIcon:
                        const Icon(Icons.grid_view_rounded, color: Colors.white),
                    label: "More",
                  ),
                ],
                iconSize: 35,
                backgroundColor: Colors.transparent,
                showSelectedLabels: true,
                showUnselectedLabels: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
