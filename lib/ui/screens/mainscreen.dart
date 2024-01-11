import 'package:flutter/material.dart';
import 'package:manage_my_store/ui/screens/profilescreen.dart';

import 'shopscreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  static const List<Widget> _bottomNavScreens = [
    ShopScreen(),
    ProfileScreen(),
    ShopScreen(),
    ShopScreen(),
  ];

  final List<ScreenData> _screens1 = [
    ScreenData(label: 'Home', icon: Icons.home),
    ScreenData(label: 'Search', icon: Icons.search),

  ];
  final List<ScreenData> _screens2 = [
    ScreenData(label: 'Favorite', icon: Icons.favorite),
    ScreenData(label: 'Profile', icon: Icons.person),

  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
            floatingActionButton: SizedBox(
              height: 70,
              width: 70,
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)),
                backgroundColor: Colors.orange,
                onPressed: () {},
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: Center(child: _bottomNavScreens.elementAt(selectedIndex)),
            bottomNavigationBar: SafeArea(
                bottom: false,
                child: BottomAppBar(
                    shape: const CircularNotchedRectangle(),
                    notchMargin: 10.0,
                    height: 85,
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 50.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: _screens1
                                    .asMap()
                                    .entries
                                    .map(
                                      (entry) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = entry.key;
                                      });
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          entry.value.icon,
                                          color: selectedIndex == entry.key
                                              ? Colors.blue
                                              : Colors.grey,
                                        ),
                                        Text(
                                          entry.value.label,
                                          style: TextStyle(
                                            color: selectedIndex == entry.key
                                                ? Colors.blue
                                                : Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                    .toList(),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 50.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: _screens2
                                    .asMap()
                                    .entries
                                    .map(
                                      (entry) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = entry.key;
                                      });
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          entry.value.icon,
                                          color: selectedIndex == entry.key
                                              ? Colors.blue
                                              : Colors.grey,
                                        ),
                                        Text(
                                          entry.value.label,
                                          style: TextStyle(
                                            color: selectedIndex == entry.key
                                                ? Colors.blue
                                                : Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                    .toList(),
                              ),
                            ),
                          ),
                        ]
                      ),
                    )))));
  }
}

class ScreenData {
  final String label;
  final IconData icon;
  final Widget screen;

  ScreenData(
      {required this.label,
      required this.icon,
      this.screen = const SizedBox.shrink()});
}
