import 'package:flutter/material.dart';
import 'package:manage_my_store/ui/screens/profilescreen.dart';
import 'package:manage_my_store/ui/screens/searchscreen.dart';
import 'package:manage_my_store/ui/widgets/mainscreenwidgets/bottomappbar.dart';

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
    SearchScreen(),
    ProfileScreen(),
    ShopScreen(),
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
                maintainBottomViewPadding: false,
                bottom: false,
                child: BottomAppBar(
                    shape: const CircularNotchedRectangle(),
                    notchMargin: 10.0,
                    height: 85,
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: CustomBottomAppbar(
                        onChanged: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      ),
                    )))));
  }
}
