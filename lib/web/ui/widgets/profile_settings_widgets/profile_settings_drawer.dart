import 'package:flutter/material.dart';
import '../../../../mobile/ui/widgets/custom_text.dart';

class ProfileSettingsDrawer extends StatefulWidget {
  final ValueChanged<int> onValueChange;

  const ProfileSettingsDrawer({super.key, required this.onValueChange});

  @override
  State<ProfileSettingsDrawer> createState() => _ProfileSettingsDrawerState();
}

class _ProfileSettingsDrawerState extends State<ProfileSettingsDrawer> {
  int selectedIndex = 0;
  final List<String> options = [
    'General Setting',
    'Passwords',
    'User Goals',
    'Value Adjustment',
    'Return Items',
    'Logout',
  ];

  final List iconData = [
    Icons.dashboard,
    Icons.add_box_outlined,
    Icons.auto_graph_outlined,
    Icons.inventory_outlined,
    Icons.free_cancellation,
    Icons.email,
    Icons.account_balance_outlined,
    Icons.settings,
    Icons.logout
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 250,
      decoration: const BoxDecoration(
          border: Border(right: BorderSide(color: Colors.black26))),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: ListTile(
              selected: selectedIndex == index ? true : false,
              selectedColor: Colors.black87,
              titleTextStyle: TextStyle(
                  color: index == 8 ? Colors.red.shade500 : Colors.black38,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
              iconColor: index == 8 ? Colors.red.shade500 : Colors.black38,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    options[index],
                  ),
                  Icon(
                    iconData[index],
                  )
                ],
              ),
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                // Handle Logout
                widget.onValueChange(selectedIndex);
              },
            ),
          );
        },
        itemCount: options.length,
      ),
    );
  }
}
