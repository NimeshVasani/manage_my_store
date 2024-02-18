import 'package:flutter/material.dart';

class ProductCategories extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final List listImg;
  final List listName;

  const ProductCategories({super.key, required this.onChanged, required this.listImg, required this.listName});

  @override
  State<ProductCategories> createState() => _ProductCategoriesState();
}

class _ProductCategoriesState extends State<ProductCategories> {
  var selectedIndex = 0;


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
                              widget.listImg[index],
                              height: 95,
                              width: 80,
                              fit: BoxFit.contain,
                            ),
                            Text(
                             widget.listName[index],
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
