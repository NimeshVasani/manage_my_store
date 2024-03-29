import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_my_store/mobile/ui/widgets/custom_text.dart';

class DailyVisits extends StatefulWidget {
  final double height;
  final double width;
  final String data;
  final String type;
  final String img;
  const DailyVisits({super.key, required this.height, required this.data, required this.width, required this.img, required this.type});

  @override
  State<DailyVisits> createState() => _DailyVisitsState();
}

class _DailyVisitsState extends State<DailyVisits> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Card(
          elevation: 5.0,
          margin: EdgeInsets.zero,
          child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              width: widget.width/4 -5,
              height: widget.height/2 -5,
              child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customTextView(widget.data, 20, FontWeight.w600, Colors.black.withOpacity(0.75), 1),
                          customTextView(widget.type, 14, FontWeight.w600, Colors.black45, 1)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Image.asset(widget.img,fit: BoxFit.cover,height: 50,width: 100,),
                    )
                  ],
                ),
              )
        ),
    );
  }
}
