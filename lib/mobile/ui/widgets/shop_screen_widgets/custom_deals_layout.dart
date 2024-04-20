import 'package:flutter/material.dart';
import 'package:manage_my_store/model/web/item.dart';

import '../custom_text.dart';

class CustomDealsLayout extends StatefulWidget {
  final List<FirebaseItem> items;
  const CustomDealsLayout({super.key, required this.items, });

  @override
  State<CustomDealsLayout> createState() => _CustomDealsLayoutState();
}

class _CustomDealsLayoutState extends State<CustomDealsLayout> {
  var imageList = [
    'assets/images/cheese_deals.png',
    'assets/images/vegitables_deals.jpg',
    'assets/images/summer_deals.png',
    'assets/images/fruits_deals.png',
  ];

  var offerNames = [
    'Cheesy-deals For you',
    'Fresh vegetables, Better health',
    'Stay cool in this Summer..!',
    'Seasonable fruits offers'
  ];

  var offerData = [
    '30% flat off, for All cheese lovers',
    '20% off in potatoes',
    'Discount on all Ice-creams',
    'Buy apple for 10% off'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Colors.black45,
                    BlendMode.srcATop,
                  ),
                  child: Image.asset(
                    imageList[index],
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 30.0, left: 20.0, right: 20.0, bottom: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customTextView(offerNames[index], 24, FontWeight.w600,
                        Colors.white, 2),
                    const SizedBox(height: 50,),
                    SizedBox(
                      width: 200,
                      child: customTextView(
                          offerData[index], 20, FontWeight.w600, Colors.white, 3),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          clipBehavior: Clip.hardEdge,
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red)),
                          onPressed: () {

                          },
                          child: customTextView('Activate Offer', 20,
                              FontWeight.w600, Colors.white, 1),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        );
      },
      itemCount: offerNames.length,
      shrinkWrap: true,
    );
  }
}

