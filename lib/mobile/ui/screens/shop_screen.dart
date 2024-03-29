import 'package:flutter/material.dart';
import 'package:manage_my_store/mobile/ui/widgets/shopscreenwidgets/app_bar.dart';
import 'package:provider/provider.dart';

import '../../../viewmodels/authentication/mobile_auth_view_model.dart';
import '../widgets/shopscreenwidgets/custom_deals_layout.dart';
import '../widgets/shopscreenwidgets/custom_grid.dart';


class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  late MobileAuthViewModel authViewModel;
  late ScrollController _scrollController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    authViewModel = Provider.of<MobileAuthViewModel>(context, listen: false);
    _scrollController = ScrollController();

    // Other initialization logic
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
            CustomAppBar(
              onChanged: (index) {
                setState(() {
                  selectedIndex = index;
                  _scrollController.animateTo(40.0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                });
              },
            ),
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
                                const SizedBox(
                                  height: 5,
                                ),
                                selectedIndex == 0
                                    ? const CustomDealsLayout()
                                    : const CustomGridLayout(),
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
