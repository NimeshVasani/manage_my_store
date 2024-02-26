import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manage_my_store/web/ui/widgets/add_items_widgets/custom_drop_down.dart';
import 'package:manage_my_store/web/ui/widgets/utils/input_text_filed.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController quantityEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: InputTextField(
                      textEditingController: textEditingController,
                      name: 'Product Name',
                      hint: "Enter Product Name",
                      textInputType: TextInputType.text,
                      textInputFormatter: [],
                      iconData: null)),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                  child: InputTextField(
                      textEditingController: textEditingController,
                      name: 'Brand Name',
                      hint: "Enter Brand Or Company",
                      textInputFormatter: [],
                      textInputType: TextInputType.text,
                      iconData: null)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Expanded(
                  flex: 1, child: CustomDropDown(name: 'Select Unit')),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                  flex: 1,
                  child: InputTextField(
                      textEditingController: quantityEditingController,
                      name: 'Quantity',
                      hint: "Enter quantity of Item",
                      textInputFormatter: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      textInputType: TextInputType.phone,
                      iconData: null)),
            ],
          )
        ],
      ),
    );
  }
}
