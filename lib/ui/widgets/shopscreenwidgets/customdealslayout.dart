import 'package:flutter/cupertino.dart';

class CustomDealsLayout extends StatefulWidget {
  const CustomDealsLayout({super.key});

  @override
  State<CustomDealsLayout> createState() => _CustomDealsLayoutState();
}

class _CustomDealsLayoutState extends State<CustomDealsLayout> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          ],
        );
      },
      itemCount: 5,
      shrinkWrap: true,
    );
  }
}
