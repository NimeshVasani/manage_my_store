import 'package:flutter/material.dart';

Widget customSearchBar() {
  return const Card(
    color: Colors.white,
    surfaceTintColor: Colors.white,
    elevation: 2,
    margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
    child: TextField(
      textAlignVertical: TextAlignVertical.center,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      textAlign: TextAlign.start,
      autocorrect: false,
      maxLines: 1,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          hintText: 'search by name or category',
          prefixIcon: Icon(Icons.search_rounded)
      ),

    ),
  );
}
