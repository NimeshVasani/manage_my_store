import 'package:flutter/material.dart';

import '../../../../mobile/ui/widgets/customtext.dart';

class CustomCard extends StatefulWidget {
  final Widget customChild;
  final String selectedType;

  const CustomCard({super.key, required this.customChild, required this.selectedType});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      surfaceTintColor: Colors.transparent,
      color: Colors.white,
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                customTextView(
                    "Product Type : ", 18, FontWeight.w500, Colors.black, 1),
                customTextView(
                    widget.selectedType, 14, FontWeight.w500, Colors.black38, 1),
                const Spacer(),
                InkWell(
                  child: customTextView("+ Add category", 18, FontWeight.w500,
                      Colors.blue.shade900, 1),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.black54,
          ),
          const SizedBox(
            height: 10,
          ),
          Scrollbar(
              thumbVisibility: true,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: widget.customChild,
              )),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
