import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_my_store/mobile/ui/widgets/customtext.dart';
import 'package:manage_my_store/web/ui/widgets/productcategories.dart';

class AddItems extends StatefulWidget {
  const AddItems({super.key});

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customTextView(
                        "Product Type", 18, FontWeight.w500, Colors.black, 1),
                    InkWell(
                      child: customTextView("+ Add category", 18,
                          FontWeight.w500, Colors.blue.shade900, 1),
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
              ProductCategories(onChanged: (int index) {}),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Card(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customTextView(
                        "Product Type", 18, FontWeight.w500, Colors.black, 1),
                    InkWell(
                      child: customTextView("+ Add category", 18,
                          FontWeight.w500, Colors.blue.shade900, 1),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              ProductCategories(onChanged: (int index) {}),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
