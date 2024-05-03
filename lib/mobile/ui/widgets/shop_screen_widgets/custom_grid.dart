import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import '../../../../model/web/item.dart';
import '../custom_text.dart';

class CustomGridLayout extends StatefulWidget {
  final ValueChanged<int> itemId;
  final List<FirebaseItem> items;

  const CustomGridLayout({super.key, required this.items, required this.itemId});

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
        children: List.generate(widget.items.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26, width: 1),
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){

                          },
                          child: const Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.black26,
                            size: 30,
                          ),
                        ),
                        widget.items[index].discount > 0
                            ? badges.Badge(
                                showBadge: true,
                                ignorePointer: false,
                                onTap: () {},
                                badgeContent: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0,
                                      right: 8.0,
                                      top: 12.0,
                                      bottom: 12.0),
                                  child:
                                      Text('${widget.items[index].discount}%'),
                                ),
                                badgeAnimation:
                                    const badges.BadgeAnimation.rotation(
                                  animationDuration: Duration(seconds: 1),
                                  colorChangeAnimationDuration:
                                      Duration(seconds: 1),
                                  loopAnimation: false,
                                  curve: Curves.fastOutSlowIn,
                                  colorChangeAnimationCurve: Curves.bounceInOut,
                                ),
                                badgeStyle: const badges.BadgeStyle(
                                  shape: badges.BadgeShape.instagram,
                                  badgeColor: Colors.blue,
                                  padding: EdgeInsets.all(0),
                                  borderSide: BorderSide(
                                      color: Colors.orange, width: 1),
                                  borderGradient: badges.BadgeGradient.linear(
                                      colors: [Colors.red, Colors.black]),
                                  badgeGradient: badges.BadgeGradient.linear(
                                    colors: [Colors.red, Colors.yellow],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  elevation: 0,
                                ),
                              )
                            : Container(
                                height: 40,
                              ),
                      ],
                    ),
                    Center(
                      child: ConstrainedBox(
                        constraints:
                            const BoxConstraints(minWidth: 130, minHeight: 130),
                        child: Image.network(
                          widget.items[index].image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customTextView(widget.items[index].productName, 20,
                            FontWeight.w500, Colors.black, 1),
                        customTextView(widget.items[index].brandName, 14,
                            FontWeight.normal, Colors.black54, 1),
                        customTextView(
                            '\$${widget.items[index].price}/${widget.items[index].unit}',
                            18,
                            FontWeight.bold,
                            Colors.black,
                            1),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
