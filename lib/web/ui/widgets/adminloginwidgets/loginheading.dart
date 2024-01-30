import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../mobile/ui/widgets/customtext.dart';

Widget loginHeading() {
  return Container(
    height: 80.0,
    color: Colors.green.shade500,
    child: Center(
      child: customTextView(
          'Admin login', 20, FontWeight.w600, CupertinoColors.white, 1),
    ),
  );
}
