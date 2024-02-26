import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../mobile/ui/widgets/customtext.dart';

class CustomDropDown extends StatefulWidget {
  final String name;

  const CustomDropDown({super.key, required this.name});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String selectedInterval = 'Select One'; // Default selection

  List<String> intervalOptions = ['Select One', 'Kilo Gram (KGs)', 'Litter (Ltr)', 'Pieces (PCs)', 'Lbs'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customTextView(widget.name, 14, FontWeight.w600, Colors.black, 1),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.black54)),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: DropdownButton<String>(
              underline: Container(),
              dropdownColor: Colors.white,
              value: selectedInterval,
              focusNode: FocusNode(canRequestFocus: false),
              items: intervalOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(color: Colors.black87),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedInterval = newValue!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}