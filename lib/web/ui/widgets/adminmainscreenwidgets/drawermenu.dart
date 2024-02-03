import 'package:flutter/material.dart';
import '../../../../mobile/ui/widgets/customtext.dart';

class CustomDrawer extends StatefulWidget {
  final ValueChanged<int> onValueChange;

  const CustomDrawer({super.key, required this.onValueChange});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int selectedIndex = 0;
  final List<String> options = [
    'Admin Dashboard',
    'Add Items',
    'Current Stocks',
    'New Orders',
    'Return Items',
    'Emails',
    'Income/Outgoing',
    'Profile Settings',
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
    return Expanded(
      child: Card(
        elevation: 5.0,
        margin: EdgeInsets.zero,
        surfaceTintColor: Colors.transparent,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 160,
              child: Stack(
                children: [
                  ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.black54,
                      BlendMode.srcATop,
                    ),
                    child: Image.asset(
                      'assets/web/web_back.jpg',
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 160,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 30.0, left: 20.0, right: 20.0, bottom: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customTextView('Fountainhead Tuck Shop', 18,
                              FontWeight.w500, Colors.white, 2),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: ListTile(
                      selected: selectedIndex == index ? true : false,
                      selectedTileColor: Colors.black12,
                      selectedColor: Colors.black87,
                      titleTextStyle: TextStyle(
                          color:
                              index == 8 ? Colors.red.shade500 : Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                      iconColor:
                          index == 8 ? Colors.red.shade500 : Colors.black45,
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
            ),
          ],
        ),
      ),
    );
  }
}
