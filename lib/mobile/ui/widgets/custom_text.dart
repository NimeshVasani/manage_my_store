import 'package:flutter/material.dart';

Widget customTextView(String data, double fontSize, FontWeight fontWeight,
    Color color, int maxLines,{TextAlign textAlign = TextAlign.start}) {
  return Text(
    data,
    textAlign: textAlign,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      overflow: TextOverflow.ellipsis,

    ),
    maxLines: maxLines,
  );

}
