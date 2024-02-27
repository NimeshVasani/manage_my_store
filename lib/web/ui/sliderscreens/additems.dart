import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:manage_my_store/web/ui/widgets/add_items_widgets/customcard.dart';
import 'package:manage_my_store/web/ui/widgets/add_items_widgets/image_chooser.dart';
import 'package:manage_my_store/web/ui/widgets/add_items_widgets/product_desc.dart';
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
        const CustomCard(
          selectedType: "",
          customChild: ProductDetails(),
          isBtn: false,
          name: "Product Details",
        ),
        const SizedBox(
          height: 20,
        ),
        const CustomCard(
            customChild: ImageChooser(),
            selectedType: "",
            isBtn: false,
            name: "Choose Image"),
        const SizedBox(
          height: 20,
        ),
        const CustomCard(
          selectedType: "",
          customChild: ProductDescription(),
          isBtn: false,
          name: "Optional Info",
        ),

        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: SwipeButton.expand(
            width: 400,
            borderRadius: BorderRadius.circular(30.0),
            height: 60,
            thumb: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            activeThumbColor: Colors.green,
            activeTrackColor: Colors.green.shade200,
            onSwipe: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Product Added"),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text(
              "Add to store",
              style: TextStyle(color: Colors.black54, fontSize: 20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(20)),
            width: 200,
            child: TextButton(
                clipBehavior: Clip.hardEdge,
                onPressed: () {},
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
        ),
        const SizedBox(
          height: 100,
        )
      ],
    );
  }
}
