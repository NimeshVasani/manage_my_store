import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class FilterMenu extends StatefulWidget {
  const FilterMenu({super.key});

  @override
  State<FilterMenu> createState() => _FilterMenuState();
}

class _FilterMenuState extends State<FilterMenu> {
  // Define variables for the selected options
  String sortBy = 'Name';
  bool ascending = true;
  String selectOption = 'All Items';

  // List of sort by options
  List<String> sortByOptions = ['Name', 'Price', 'Offer'];

  // List of select options
  List<String> selectOptions = [
    'All Items',
    'General',
    'Fruits',
    'Vegetables',
    'Asian',
    'American'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 8.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Sort by dropdown
          Container(
            decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.sort),
                  DropdownButton2<String>(
                    underline: null,
                    iconStyleData:
                        const IconStyleData(icon: Icon(null), iconSize: 0),
                    value: sortBy,
                    onChanged: (newValue) {
                      setState(() {
                        sortBy = newValue!;
                      });
                    },
                    items: sortByOptions.map((String option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.filter_alt),
                  DropdownButton2<String>(
                    alignment: Alignment.centerLeft,
                    iconStyleData:
                        const IconStyleData(icon: Icon(null), iconSize: 0),
                    underline: null,
                    value: selectOption,
                    onChanged: (newValue) {
                      setState(() {
                        selectOption = newValue!;
                      });
                    },
                    items: selectOptions.map((String option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          // Add to cart button
          Material(
            color: Colors.green.shade400,
            borderRadius: BorderRadius.circular(10.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(10.0),
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Add to cart  🛒',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
