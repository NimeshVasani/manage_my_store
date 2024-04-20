import 'package:flutter/material.dart';
import 'package:manage_my_store/model/web/store.dart';

import 'categories.dart';

class CustomAppBar extends StatefulWidget {
  final ValueChanged<int> onChanged;

  final List<String>  stores;

  const CustomAppBar({super.key, required this.onChanged, required this.stores});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: const Color(0xFF003366),
        surfaceTintColor: Colors.transparent,
        // Set this height
        expandedHeight: 200,
        collapsedHeight: 160,
        clipBehavior: Clip.hardEdge,
        automaticallyImplyLeading: false,
        primary: false,
        flexibleSpace: FlexibleSpaceBar(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 130,
                  width: double.infinity,
                  child: Categories(
                    onChanged: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                   widget.onChanged(selectedIndex);
                    },
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Center(
                  child: SizedBox(
                      width: 50,
                      child: Divider(
                        thickness: 3,
                        color: Colors.black38,
                      )),
                ),
              ],
            ),
            centerTitle: false,
            titlePadding: EdgeInsets.zero,
            expandedTitleScale: 1,
            background: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF003366), Color(0xFF66ccff)],
                  // Add your desired colors
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0,),
                    child: SizedBox(
                      width: 250,
                      child: Text(
                        widget.stores.isNotEmpty?
                        widget.stores[0]:"Empty Store list",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text(
                      'Change Store',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blueAccent),
                    ),
                  ),
                ],
              ),
            )),
        snap: false,
        pinned: true,
        floating: false);
  }
}
