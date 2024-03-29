import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

import '../custom_text.dart';

class CustomGridLayout extends StatefulWidget {
  const CustomGridLayout({super.key});

  @override
  State<CustomGridLayout> createState() => _CustomGridLayoutState();
}

class _CustomGridLayoutState extends State<CustomGridLayout> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        childAspectRatio: 2 / 3,
        crossAxisCount: 2,
        children: List.generate(20, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26, width: 1),
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.black26,
                          size: 30,
                        ),
                        badges.Badge(
                          showBadge: true,
                          ignorePointer: false,
                          onTap: () {},
                          badgeContent: const Padding(
                            padding: EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 12.0, bottom: 12.0),
                            child: Text('10%'),
                          ),
                          badgeAnimation: const badges.BadgeAnimation.rotation(
                            animationDuration: Duration(seconds: 1),
                            colorChangeAnimationDuration: Duration(seconds: 1),
                            loopAnimation: false,
                            curve: Curves.fastOutSlowIn,
                            colorChangeAnimationCurve: Curves.bounceInOut,
                          ),
                          badgeStyle: const badges.BadgeStyle(
                            shape: badges.BadgeShape.instagram,
                            badgeColor: Colors.blue,
                            padding: EdgeInsets.all(0),
                            borderSide:
                                BorderSide(color: Colors.orange, width: 1),
                            borderGradient: badges.BadgeGradient.linear(
                                colors: [Colors.red, Colors.black]),
                            badgeGradient: badges.BadgeGradient.linear(
                              colors: [Colors.red, Colors.yellow],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            elevation: 0,
                          ),
                        ),
                      ],
                    ),
                    Image.asset('assets/images/fruits.png'),
                    const SizedBox(
                      height: 5,
                    ),
                    customTextView(
                        'American mango', 20, FontWeight.w500, Colors.black, 1),
                    customTextView('Produced in latin america', 14,
                        FontWeight.normal, Colors.black54, 1),
                    customTextView(
                        '\$12.99/lb', 18, FontWeight.bold, Colors.black, 1),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
