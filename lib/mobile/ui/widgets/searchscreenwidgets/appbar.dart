import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'customsearchbar.dart';

SliverAppBar appBar() {
  return SliverAppBar(
      backgroundColor: const Color(0xFF003366),
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
                colors: [Color(0xFF003366), Color(0xFF66ccff)],
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
