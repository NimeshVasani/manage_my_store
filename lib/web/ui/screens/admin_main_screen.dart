import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_my_store/web/ui/screens/admin_login.dart';
import 'package:manage_my_store/web/ui/sliderscreens/add_items.dart';
import 'package:manage_my_store/web/ui/sliderscreens/dashboard.dart';
import 'package:manage_my_store/web/ui/sliderscreens/profile_setting.dart';
import 'package:manage_my_store/web/ui/widgets/adminmainscreenwidgets/custom_app_bar.dart';
import 'package:manage_my_store/web/ui/widgets/adminmainscreenwidgets/drawer_menu.dart';
import 'package:provider/provider.dart';
import '../../../viewmodels/authentication/web_auth_view_model.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  late WebAuthViewModel authViewModel;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int currentScreen = 0;
  var width;
  @override
  void initState() {
    super.initState();
    authViewModel = Provider.of<WebAuthViewModel>(context, listen: false);


    // Other initialization logic
  }

  @override
  Widget build(BuildContext context) {
    final List sliderScreens = [
      const DashBoard(),
      const AddItems(),
      const ProfileSetting()
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Expanded(
          child: SizedBox(
            width: PlatformDispatcher.instance.displays.first.size.width,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        width: 250,
                        height: double.infinity,
                        child: CustomDrawer(
                          onValueChange: (int selectedIndex) {
                            setState(() {
                              currentScreen = selectedIndex;
                            });
                            switch (selectedIndex) {
                              case 8:
                                authViewModel.signOut();
                                Navigator.pushReplacement(context, CupertinoPageRoute(
                                    builder: (BuildContext context) {
                                  return const AdminLoginScreen();
                                }));
                                break;
                            }
                          },
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            customAppbar(),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                                child: SingleChildScrollView(
                                    child: sliderScreens[currentScreen]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
