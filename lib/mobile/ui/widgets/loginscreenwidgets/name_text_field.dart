
import 'package:flutter/material.dart';

Widget nameTextField(TextEditingController textEditingController) {
  return  Card(
    color: Colors.white,
    surfaceTintColor: Colors.white,
    elevation: 2,
    margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
    child: TextField(
      controller: textEditingController,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      textAlign: TextAlign.start,
      autocorrect: false,
      maxLines: 1,

      decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          hintText: 'Enter Your Name',
          prefixIcon: Icon(Icons.man_2)
      ),

    ),
  );
}
