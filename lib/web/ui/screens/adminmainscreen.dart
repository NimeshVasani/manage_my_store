import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_my_store/web/ui/screens/adminlogin.dart';
import 'package:manage_my_store/web/ui/sliderscreens/dashboard.dart';
import 'package:manage_my_store/web/ui/widgets/adminmainscreenwidgets/customAppbar.dart';
import 'package:manage_my_store/web/ui/widgets/adminmainscreenwidgets/drawermenu.dart';
import 'package:provider/provider.dart';
import '../../../viewmodels/authentication/webauthviewmodel.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  late WebAuthViewModel authViewModel;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
    ];

    int currentScreen = 0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 300,
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
                        height: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50.0,right: 50.0),
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
    );
  }
}
