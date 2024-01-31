import 'package:flutter/material.dart';
import '../../../../mobile/ui/widgets/customtext.dart';

AppBar loginAppBar(String title) {
  return AppBar(
    toolbarHeight: kToolbarHeight+50,
    backgroundColor: Colors.blue.shade900,
    automaticallyImplyLeading: false,
    title: customTextView(
        title, 22, FontWeight.w600, Colors.white, 2,
        textAlign: TextAlign.center),
  );
}
