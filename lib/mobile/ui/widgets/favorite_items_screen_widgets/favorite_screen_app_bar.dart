import 'package:flutter/material.dart';
import 'package:manage_my_store/mobile/ui/widgets/favorite_items_screen_widgets/filter_menu.dart';

import '../search_screen_widgets/custom_search_bar.dart';

SliverAppBar favoriteScreenAppBar() {
  return SliverAppBar(
      backgroundColor: const Color(0xFF003366),
      surfaceTintColor: Colors.transparent,
      expandedHeight: 120,
      collapsedHeight: 80,
      clipBehavior: Clip.hardEdge,
      automaticallyImplyLeading: false,
      primary: false,
      flexibleSpace: FlexibleSpaceBar(
          title: const FilterMenu(),
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
                'Your Favorite Items',
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
