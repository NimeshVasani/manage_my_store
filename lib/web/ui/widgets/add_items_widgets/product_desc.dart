import 'package:flutter/material.dart';
import 'package:manage_my_store/web/ui/widgets/utils/input_text_filed.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: InputTextField(
          textEditingController: textEditingController,
          name: 'Product Description',
          hint: "Enter Product Description",
          textInputType: TextInputType.multiline,
          textInputFormatter: [],
          maxLines: 5,
          textInputAction: TextInputAction.newline,
          iconData: Icons.description,
        onChanged: (data){
        },
      ) ,
    );
  }
}
