import 'package:flutter/material.dart';

class ProductCategories extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const ProductCategories({super.key, required this.onChanged});

  @override
  State<ProductCategories> createState() => _ProductCategoriesState();
}

class _ProductCategoriesState extends State<ProductCategories> {
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
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: InkWell(
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      widget.onChanged(selectedIndex);
                    },
                    child: Card(
                      surfaceTintColor: Colors.white,
                      elevation: 2.0,
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: selectedIndex == index
                            ? BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: Colors.blue.shade900, width: 2))
                            : BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10.0)),
                        width: 250,
                        child: Column(
                          children: [
                            Image.asset(
                              listImg[index],
                              height: 95,
                              width: 80,
                              fit: BoxFit.contain,
                            ),
                            Text(
                              lisName[index],
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Text(
                              "200 items",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.black),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
