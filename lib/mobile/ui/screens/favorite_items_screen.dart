import 'package:flutter/material.dart';
import 'package:manage_my_store/mobile/ui/widgets/favorite_items_screen_widgets/favorite_screen_app_bar.dart';

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
              favoriteScreenAppBar(),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                      // The builder function returns a ListTile with a title that
                      // displays the index of the current item.
                      (context, index) => Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Container(height: MediaQuery.of(context).size.height-200,)),
                      childCount: 1))
            ]),
      ),
    );
  }
}
