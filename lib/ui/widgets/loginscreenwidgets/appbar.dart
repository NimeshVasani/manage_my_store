import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context){
return AppBar(
  backgroundColor: Colors.transparent,
  leading: Padding(
    padding: const EdgeInsets.only(
      top: 10,
      left: 10,
    ),
    child: InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.pop(context);
      },
      child: const Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            ),
            Text(
              " Back",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
              ),
            ),
          ]),
    ),
  ),
  leadingWidth: 100,
);
}