import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../mobile/ui/widgets/customtext.dart';

Widget loginHeading(String title) {
  return Container(
    height: 80.0,
    color: Colors.green.shade500,
    child: Center(
      child: customTextView(
          title, 20, FontWeight.w600, CupertinoColors.white, 1),
    ),
  );
}
