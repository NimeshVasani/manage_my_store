import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_my_store/web/ui/widgets/add_items_widgets/customcard.dart';
import 'package:manage_my_store/web/ui/widgets/add_items_widgets/product_details.dart';
import 'package:manage_my_store/web/ui/widgets/add_items_widgets/productcategories.dart';

class AddItems extends StatefulWidget {
  const AddItems({super.key});

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  late String productType;

  @override
  void initState() {
    super.initState();
    productType = productTypeName[0];
  }

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
        CustomCard(
            selectedType: productType,
            customChild: ProductCategories(
              onChanged: (index) {
                setState(() {
                  productType = productTypeName[index];
                });
              },
              listImg: productTypeImg,
              listName: productTypeName,
            ),
          isBtn: true,
          name: "Product Type : ",
        ),
        const SizedBox(
          height: 20,
        ),
        CustomCard(
            selectedType: "",
            customChild: ProductDetails(

            ),
          isBtn: false,
          name: "Product Details",
        ),
      ],
    );
  }
}
