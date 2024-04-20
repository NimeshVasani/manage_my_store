import 'package:flutter/material.dart';

class FavoriteItemsScreen extends StatefulWidget {
  const FavoriteItemsScreen({super.key});

  @override
  State<FavoriteItemsScreen> createState() => _FavoriteItemsScreenState();
}

class _FavoriteItemsScreenState extends State<FavoriteItemsScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF003366),
      body: SafeArea(
        child: CustomScrollView(
            shrinkWrap: true,
            controller: _scrollController,
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                      // The builder function returns a ListTile with a title that
                      // displays the index of the current item.
                      (context, index) => Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Container()),
                      childCount: 10))
            ]),
      ),
    );
  }
}
