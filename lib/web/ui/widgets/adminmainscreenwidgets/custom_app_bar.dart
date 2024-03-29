import 'package:flutter/material.dart';
import 'package:manage_my_store/mobile/ui/widgets/searchscreenwidgets/custom_search_bar.dart';

import '../../../../mobile/ui/widgets/custom_text.dart';

Widget customAppbar() {
  return Card(
    elevation: 3.0,
    margin: EdgeInsets.zero,
    surfaceTintColor: Colors.transparent,
    shape: const RoundedRectangleBorder(),
    child: Container(
        padding: EdgeInsets.zero,
        height: kToolbarHeight,
        color: Colors.white54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 250,
              height: 35,
              child: customSearchBar(EdgeInsets.zero),
            ),
            const Spacer(
              flex: 1,
            ),
            customTextView(
                "Admin Dashboard", 20, FontWeight.w600, Colors.black87, 2),
            const Spacer(
              flex: 2,
            ),
            const Icon(
              Icons.notifications_active,
              color: Colors.black54,
            ),
            const SizedBox(
              width: 10,
            ),
           Container(
             height: 25,
             width: 25,
             clipBehavior: Clip.hardEdge,
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.5)),
             child:  Image.asset("assets/images/login_img.png",fit: BoxFit.fill,),),
            const SizedBox(
              width: 10,
            ),
          ],
        )),
  );
}
