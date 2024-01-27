import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_my_store/ui/widgets/shopscreenwidgets/customdealslayout.dart';
import 'package:manage_my_store/ui/widgets/shopscreenwidgets/customgrid.dart';

import '../widgets/searchscreenwidgets/appbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late ScrollController _scrollController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF333300),
        body: SafeArea(
            child: CustomScrollView(
                shrinkWrap: true,
                controller: _scrollController,
                physics: const ClampingScrollPhysics(),
                slivers: [
              appBar(),
              SliverList(

                  delegate: SliverChildBuilderDelegate(
                      // The builder function returns a ListTile with a title that
                      // displays the index of the current item.
                      (context, index) => Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: const CustomGridLayout()),
                      childCount: 1))
            ])));
  }
}