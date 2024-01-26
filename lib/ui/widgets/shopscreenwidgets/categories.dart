import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  final ValueChanged<int> onChanged;
  const Categories({super.key, required this.onChanged});
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  var selectedIndex = 0;

  var listImg = [
    'assets/images/deals.png',
    'assets/images/general.png',
    'assets/images/fruits.png',
    'assets/images/vegitables.png',
    'assets/images/asian.png',
    'assets/images/american.png',
    'assets/images/oil.png',
  ];
  var lisName = [
    'Deals',
    'General',
    'Fruits',
    'Vegetables',
    'Asian',
    'American',
    'Oil'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: SizedBox(
        height: 130,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                widget.onChanged(selectedIndex);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Container(
                  decoration: selectedIndex == index
                      ? BoxDecoration(
                    color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.red, width: 3))
                      : BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
                  width: 90,
                  child: Column(
                    children: [
                      Image.asset(
                        listImg[index],
                        height: 100,
                        width: 80,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        lisName[index],
                        style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
