import 'package:flutter/material.dart';
import 'package:manage_my_store/web/ui/widgets/additemswidgets/productcategories.dart';

import '../../../../mobile/ui/widgets/customtext.dart';

Widget customCard(Widget customChild){
  return Card(
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
        Scrollbar(
            thumbVisibility: true,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: customChild,
            )),
        const SizedBox(
          height: 30,
        ),
      ],
    ),
  );
  }
