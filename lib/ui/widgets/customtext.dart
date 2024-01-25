import 'package:flutter/material.dart';

Widget customTextView(String data, double fontSize, FontWeight fontWeight,
    Color color, int maxLines) {
  return Text(
    data,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      overflow: TextOverflow.ellipsis,
    ),
    maxLines: maxLines,
  );
}
