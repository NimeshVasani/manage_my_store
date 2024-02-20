import 'package:flutter/material.dart';

Widget customSearchBar(EdgeInsets margin) {
  return Card(
    clipBehavior: Clip.hardEdge,
    color: Colors.white,
    surfaceTintColor: Colors.white,
    elevation: 2,
    margin: margin,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
    child: const TextField(
      clipBehavior: Clip.hardEdge,
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
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          hintText: 'search by name or category',
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          prefixIcon: Icon(Icons.search_rounded)),
    ),
  );
}
