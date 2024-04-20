import 'package:flutter/material.dart';

Widget emailTextField(TextEditingController textEditingController) {
  return Card(
    color: Colors.white,
    surfaceTintColor: Colors.white,
    elevation: 2,
    margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
    child: TextField(
      controller: textEditingController,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      textAlign: TextAlign.start,
      autocorrect: false,
      maxLines: 1,
      decoration: const InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide.none),
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          hintText: 'Enter Email Address',
          prefixIcon: Icon(Icons.email)),
    ),
  );
}
