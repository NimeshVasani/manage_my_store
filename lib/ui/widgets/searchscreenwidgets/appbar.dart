import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:manage_my_store/ui/widgets/searchscreenwidgets/customsearchbar.dart';

SliverAppBar appBar() {
  return SliverAppBar(
      backgroundColor: const Color(0xFF333300),
      surfaceTintColor: Colors.transparent,
      // Set this height
      expandedHeight: 120,
      collapsedHeight: 80,
      clipBehavior: Clip.hardEdge,
      automaticallyImplyLeading: false,
      primary: false,
      flexibleSpace: FlexibleSpaceBar(
          title: customSearchBar(),
          centerTitle: false,
          titlePadding: EdgeInsets.zero,
          expandedTitleScale: 1,
          background: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF333300), Color(0xFF999966)],
                // Add your desired colors
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(bottom: 20.0, left: 15.0),
              child: Text(
                'Search your items',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
          )),
      snap: false,
      pinned: true,
      floating: false);
}
