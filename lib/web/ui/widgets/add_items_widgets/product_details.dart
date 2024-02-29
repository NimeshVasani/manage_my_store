import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manage_my_store/model/web/item.dart';
import 'package:manage_my_store/web/ui/widgets/add_items_widgets/custom_drop_down.dart';
import 'package:manage_my_store/web/ui/widgets/utils/input_text_filed.dart';

class ProductDetails extends StatefulWidget {
  final ValueChanged<String> productName;
  final ValueChanged<String> brandName;
  final ValueChanged<String> unit;
  final ValueChanged<String> quantity;
  final ValueChanged<String> price;
  final ValueChanged<String> discount;

  const ProductDetails(
      {super.key,
      required this.productName,
      required this.brandName,
      required this.unit,
      required this.quantity,
      required this.price,
      required this.discount});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController quantityEditingController = TextEditingController();
  TextEditingController priceEditingController = TextEditingController();
  TextEditingController discountEditingController = TextEditingController();
  String selectedUnit = 'not applicable';

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
                textEditingController: productNameController,
                name: 'Product Name',
                hint: "Enter Product Name",
                textInputType: TextInputType.text,
                textInputFormatter: [],
                iconData: null,
                onChanged: (data) {
                  widget.productName(data);
                },
              )),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                  child: InputTextField(
                textEditingController: brandNameController,
                name: 'Brand Name',
                hint: "Enter Brand Or Company",
                textInputFormatter: [],
                textInputType: TextInputType.text,
                iconData: null,
                onChanged: (data) {
                  widget.brandName(data);
                },
              )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: CustomDropDown(
                    name: 'Select Unit',
                    selectedUnit: (selectedUnit) {
                      this.selectedUnit = selectedUnit;
                      widget.unit(selectedUnit);
                    },
                  )),
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
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                    ],
                    textInputType: TextInputType.phone,
                    iconData: null,
                    onChanged: (data) {
                      widget.quantity(data);
                    },
                  )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: InputTextField(
                textEditingController: priceEditingController,
                name: 'Item Price',
                hint: "Enter Item Price",
                textInputFormatter: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                ],
                textInputType: TextInputType.phone,
                iconData: null,
                onChanged: (data) {
                  widget.price(data);
                },
              )),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                  child: InputTextField(
                textEditingController: discountEditingController,
                name: 'Special Discount in %',
                hint: "Enter Total Discount in %",
                textInputFormatter: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                ],
                textInputType: TextInputType.phone,
                iconData: null,
                onChanged: (data) {
                  widget.discount(data);
                },
              )),
            ],
          ),
        ],
      ),
    );
  }
}
