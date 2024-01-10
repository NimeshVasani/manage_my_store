import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget emailTextField() {
  return const Card(
    color: Colors.white,
    surfaceTintColor: Colors.white,
    elevation: 2,
    margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
    child: TextField(
      textAlignVertical: TextAlignVertical.center,
      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.start,
      autocorrect: false,
      maxLines: 1,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        hintText: 'Enter Email Address',
        prefixIcon: Icon(Icons.email)
      ),
      
    ),
  );
}
