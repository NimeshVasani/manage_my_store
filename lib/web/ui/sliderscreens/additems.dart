import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_my_store/mobile/ui/widgets/customtext.dart';
import 'package:manage_my_store/web/ui/widgets/additemswidgets/customcard.dart';
import 'package:manage_my_store/web/ui/widgets/additemswidgets/productcategories.dart';

class AddItems extends StatefulWidget {
  const AddItems({super.key});

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  var productTypeImg = [
    'assets/images/deals.png',
    'assets/images/general.png',
    'assets/images/fruits.png',
    'assets/images/vegitables.png',
    'assets/images/asian.png',
    'assets/images/american.png',
    'assets/images/oil.png',
  ];
  var productTypeName = [
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
    return Column(
      children: [
        customCard(ProductCategories(
          onChanged: (index) {},
          listImg: productTypeImg,
          listName: productTypeName,
        )),
        const SizedBox(
          height: 20,
        ),
        customCard(ProductCategories(
          onChanged: (index) {},
          listImg: productTypeImg,
          listName: productTypeName,
        )),
      ],
    );
  }
}
