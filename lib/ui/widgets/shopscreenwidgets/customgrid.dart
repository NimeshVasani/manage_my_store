import 'package:flutter/material.dart';

class CustomGridLayout extends StatefulWidget {
  const CustomGridLayout({super.key});

  @override
  State<CustomGridLayout> createState() => _CustomGridLayoutState();
}

class _CustomGridLayoutState extends State<CustomGridLayout> {
  @override
  Widget build(BuildContext context) {

    return GridView.count(
        physics:
        const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        childAspectRatio: 2/2.5,
        crossAxisCount: 2,
        children: List.generate(20, (index) {
          return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26, width: 1),
                  borderRadius: BorderRadius.circular(20.0)),

            ),
          );
        }));

  }
}
