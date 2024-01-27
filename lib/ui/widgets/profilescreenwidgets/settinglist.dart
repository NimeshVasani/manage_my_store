import 'package:flutter/material.dart';
import 'package:manage_my_store/ui/widgets/customtext.dart';

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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return Padding(
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
              child:customTextView(settingNames[index], 18, FontWeight.w500, Colors.black, 1),
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
