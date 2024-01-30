import 'package:flutter/material.dart';
import '../../../../mobile/ui/widgets/customtext.dart';

AppBar loginAppBar() {
  return AppBar(
    toolbarHeight: kToolbarHeight+50,
    backgroundColor: Colors.blue.shade900,
    title: customTextView(
        'Manage Your Store\n With Satisfaction', 22, FontWeight.w600, Colors.white, 2,
        textAlign: TextAlign.center),
  );
}
