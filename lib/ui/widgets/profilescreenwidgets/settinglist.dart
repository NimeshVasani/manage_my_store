import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_my_store/ui/screens/loginoptionscreen.dart';
import 'package:manage_my_store/ui/widgets/customtext.dart';
import 'package:provider/provider.dart';

import '../../../viewmodels/authentication/authviewmodel.dart';

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

  late AuthViewModel authViewModel;

  @override
  void initState() {
    super.initState();
    authViewModel = Provider.of<AuthViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () async {
           await authViewModel.signOut();
           if(!context.mounted) return;
            Navigator.pushReplacement(
                context, CupertinoPageRoute(builder: (BuildContext context) {
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
                  child: customTextView(
                      settingNames[index], 18, FontWeight.w500, Colors.black,
                      1),
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
