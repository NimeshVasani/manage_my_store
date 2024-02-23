
import 'package:flutter/material.dart';

Widget adminNameTextField(TextEditingController textEditingController,String hintText,IconData iconData) {
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
      decoration:  InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          hintText: hintText,
          border: InputBorder.none,
          prefixIcon: Icon(iconData)
      ),

    ),
  );
}
