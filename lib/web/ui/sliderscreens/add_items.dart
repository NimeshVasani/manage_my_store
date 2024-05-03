import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:manage_my_store/model/web/item.dart';
import 'package:manage_my_store/utils/generate_item_id.dart';
import 'package:manage_my_store/viewmodels/storage/web_storage_view_model.dart';
import 'package:manage_my_store/web/ui/widgets/add_items_widgets/custom_card.dart';
import 'package:manage_my_store/web/ui/widgets/add_items_widgets/product_categories.dart';
import 'package:manage_my_store/web/ui/widgets/add_items_widgets/product_desc.dart';
import 'package:manage_my_store/web/ui/widgets/add_items_widgets/product_details.dart';
import 'package:provider/provider.dart';

import '../../../utils/Resource.dart';
import '../../../viewmodels/firestore/web_fire_store_view_model.dart';
import '../widgets/add_items_widgets/image_chooser.dart';

class AddItems extends StatefulWidget {
  const AddItems({super.key});

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  late WebFireStoreViewModel fireStoreViewModel;
  late WebStorageViewModel storageViewModel;

  late String itemId;
  late String productType;
  late FirebaseItem firebaseItem;
  late String productName;
  late String brandName;
  late String unit;
  late String quantity;
  late String price;
  late String discount;
  late String imagePath;
  late String desc;
  var fieldClear = false;

  @override
  void initState() {
    super.initState();
    fireStoreViewModel =
        Provider.of<WebFireStoreViewModel>(context, listen: false);
    storageViewModel = Provider.of<WebStorageViewModel>(context, listen: false);
    productType = productTypeName[0];
    itemId = generateItemId();
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
              productName: (productName) {
                this.productName = productName;
              },
              brandName: (brandName) {
                this.brandName = brandName;
              },
              unit: (unit) {
                this.unit = unit;
              },
              quantity: (quantity) {
                this.quantity = quantity;
              },
              price: (String price) {
                this.price = price;
              },
              discount: (String discount) {
                this.discount = discount;
              },
              fieldClear: fieldClear),
          isBtn: false,
          name: "Product Details",
        ),
        const SizedBox(
          height: 20,
        ),
        CustomCard(
            customChild: ImageChooser(
              imagePath: (path) {
                imagePath = path;
              },
            ),
            selectedType: "",
            isBtn: false,
            name: "Choose Image"),
        const SizedBox(
          height: 20,
        ),
        CustomCard(
          selectedType: "",
          customChild: ProductDescription(
            description: (String description) {
              desc = description;
            },
            fieldClear: fieldClear,
          ),
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
            onSwipe: () async {
              saveImage(imagePath);
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

  void addItemsIntoFireStore(FirebaseItem firebaseItem) async {
    var addingStatus =
        await fireStoreViewModel.addItemIntoFireStore(firebaseItem);
    switch (addingStatus.runtimeType) {
      case const (Success<FirebaseItem>):
        {
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "${addingStatus.data!.productName} added into Store",
              style: const TextStyle(color: Colors.white54),
            ),
          ));
          clearFields();
          break;
        }
      default:
        {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              addingStatus.message.toString(),
              style: const TextStyle(color: Colors.white54),
            ),
          ));
        }
    }
  }

  void saveImage(String imagePath) async {
    var savingStatus = await storageViewModel.saveImage(imagePath);
    switch (savingStatus.runtimeType) {
      case const (Success<String>):
        {
          if (!mounted) return;
          addItemsIntoFireStore(FirebaseItem(
              itemId,
              productType,
              productName,
              brandName,
              unit,
              double.parse(quantity),
              double.parse(price).toDouble(),
              double.parse(discount).toDouble(),
              savingStatus.data.toString(),
              desc));
          break;
        }
      default:
        {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              savingStatus.message.toString(),
              style: const TextStyle(color: Colors.white54),
            ),
          ));
        }
    }
  }

  void clearFields() {
    setState(() {
      fieldClear = true;
    });
  }
}
