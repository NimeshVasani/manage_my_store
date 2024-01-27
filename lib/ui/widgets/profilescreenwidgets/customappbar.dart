import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_my_store/ui/widgets/customtext.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        expandedHeight: 260,
        elevation: 20.0,
        collapsedHeight: kToolbarHeight,
        forceElevated: true,
        backgroundColor: const Color(0xFF003366),
        surfaceTintColor: Colors.transparent,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 12,
            ),
            customTextView(
                'Account Detail', 18, FontWeight.w600, Colors.white, 1),
            const Spacer(
              flex: 9,
            ),
            const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ],
        ),
        flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.zero,
            background: Container(
                decoration:  const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF003366), Color(0xFF66ccff)
                    ])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        clipBehavior: Clip.hardEdge,
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        child: Image.asset(
                          'assets/images/vegitables_deals.jpg',
                          fit: BoxFit.cover,
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    customTextView(
                        'Nimesh Vasani', 20, FontWeight.w600, Colors.white, 1),
                    customTextView('vasaninimesh@gmail.com', 18,
                        FontWeight.normal, Colors.white, 1),
                    customTextView('+1 (647) 893-9081', 18, FontWeight.normal,
                        Colors.white, 1),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ))),
        snap: false,
        pinned: true,
        floating: false);
  }
}
