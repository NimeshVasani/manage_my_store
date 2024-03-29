import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_my_store/mobile/ui/screens/login_option_screen.dart';
import 'package:manage_my_store/mobile/ui/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../../../../viewmodels/authentication/mobile_auth_view_model.dart';

class SettingList extends StatefulWidget {
  const SettingList({super.key});

  @override
  State<SettingList> createState() => _SettingListState();
}

class _SettingListState extends State<SettingList> {
  var settingNames = [
    'Delivery Address',
    'Order History',
    'Wallet',
    'Coupons',
    'Default Payment Methods',
    'Deactivate Account',
    'Legal',
    'Customer Care',
    'Logout'
  ];

  late MobileAuthViewModel authViewModel;

  @override
  void initState() {
    super.initState();
    authViewModel = Provider.of<MobileAuthViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () async {
            await authViewModel.signOut();
            if (!context.mounted) return;
            Navigator.pushReplacement(context,
                CupertinoPageRoute(builder: (BuildContext context) {
              return const LoginOptionsScreen();
            }));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2.0,
              surfaceTintColor: Colors.transparent,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: customTextView(settingNames[index], 18,
                      FontWeight.w500, Colors.black, 1),
                ),
              ),
            ),
          ),
        );
      },
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: settingNames.length,
      shrinkWrap: true,
    );
  }
}
