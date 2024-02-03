import 'package:flutter/material.dart';

import '../../../../mobile/ui/widgets/customtext.dart';

Widget customAppbar(){
  return Card(
    elevation: 3.0,
    margin: EdgeInsets.zero,
    surfaceTintColor: Colors.transparent,
    shape: const RoundedRectangleBorder(),
    child: Container(
      padding: EdgeInsets.zero,
      height: kToolbarHeight,
      color: Colors.black,
      child: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: customTextView('Admin Dashboard', 20,
            FontWeight.w600, Colors.white, 1),
      ),
    ),
  );
}