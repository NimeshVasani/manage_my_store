import 'package:flutter/material.dart';
import 'package:manage_my_store/web/ui/widgets/utils/input_text_filed.dart';

class ProductDescription extends StatefulWidget {
  final ValueChanged<String> description;
  final bool fieldClear;

  const ProductDescription(
      {super.key, required this.description, required this.fieldClear});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  TextEditingController descriptionEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.fieldClear) {
      setState(() {
        descriptionEditingController.clear();
      });
    }
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: InputTextField(
        textEditingController: descriptionEditingController,
        name: 'Product Description',
        hint: "Enter Product Description",
        textInputType: TextInputType.multiline,
        textInputFormatter: [],
        maxLines: 5,
        textInputAction: TextInputAction.newline,
        iconData: Icons.description,
        onChanged: (data) {
          widget.description(data);
        },
      ),
    );
  }
}
