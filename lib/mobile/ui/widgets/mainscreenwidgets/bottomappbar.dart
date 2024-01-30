import 'package:flutter/material.dart';
import 'package:manage_my_store/mobile/ui/widgets/mainscreenwidgets/screendata.dart';

class CustomBottomAppbar extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const CustomBottomAppbar({super.key, required this.onChanged});

  @override
  State<CustomBottomAppbar> createState() => _CustomBottomAppbarState();
}

class _CustomBottomAppbarState extends State<CustomBottomAppbar> {
  final List<ScreenData> _screens1 = [
    ScreenData(label: 'Home', icon: Icons.home),
    ScreenData(label: 'Search', icon: Icons.search),
  ];
  final List<ScreenData> _screens2 = [
    ScreenData(label: 'Favorite', icon: Icons.favorite),
    ScreenData(label: 'Profile', icon: Icons.person),
  ];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
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
                      widget.onChanged(selectedIndex);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(entry.value.icon,
                            color: selectedIndex == entry.key
                                ? Colors.green
                                : Colors.white30,
                            size: selectedIndex == entry.key ? 35 : 25),
                        Text(
                          entry.value.label,
                          style: TextStyle(
                            color: selectedIndex == entry.key
                                ? Colors.green
                                : Colors.white30,
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
                        selectedIndex = entry.key + 2;
                      });
                      widget.onChanged(selectedIndex);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(entry.value.icon,
                            color: selectedIndex == entry.key + 2
                                ? Colors.green
                                : Colors.white30,
                            size: selectedIndex == entry.key + 2 ? 35 : 25),
                        Text(
                          entry.value.label,
                          style: TextStyle(
                            color: selectedIndex == entry.key + 2
                                ? Colors.green
                                : Colors.white30,
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
    ]);
  }
}
