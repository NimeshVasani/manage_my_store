import 'package:flutter/material.dart';
import 'package:manage_my_store/ui/widgets/shopscreenwidgets/appbar.dart';
import 'package:manage_my_store/ui/widgets/shopscreenwidgets/categories.dart';
import 'package:manage_my_store/ui/widgets/shopscreenwidgets/customdealslayout.dart';
import 'package:manage_my_store/ui/widgets/shopscreenwidgets/customgrid.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/authentication/authviewmodel.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  late AuthViewModel authViewModel;
  late ScrollController _scrollController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    _scrollController = ScrollController();

    // Other initialization logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF003300),

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
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      right: 20.0, bottom: 10.0),
                                  child: Text(
                                    'Show all',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.blueAccent),
                                  ),
                                ),
                                Categories(
                                  onChanged: (index) {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                    _scrollController.animateTo(
                                      300 - kToolbarHeight,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(
                                  thickness: 5,
                                  color: Colors.black12,
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: selectedIndex == 0
                                        ? const CustomDealsLayout()
                                        : const CustomGridLayout()),
                                const SizedBox(
                                  height: 30,
                                )
                              ]),
                        ),
                    childCount: 1))
          ])),
    );
  }
}
