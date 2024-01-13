import 'package:flutter/material.dart';
import 'package:manage_my_store/ui/widgets/shopscreenwidgets/appbar.dart';
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

  @override
  void initState() {
    super.initState();
    authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    _scrollController = ScrollController();

    // Other initialization logic
  }

  @override
  Widget build(BuildContext context) {
    var listImg = [
      'assets/images/general.png',
      'assets/images/fruits.png',
      'assets/images/vegitables.png',
      'assets/images/asian.png',
      'assets/images/american.png',
      'assets/images/oil.png',
    ];
    var lisName = [
      'General',
      'Fruits',
      'Vegetables',
      'Asian',
      'American',
      'Oil'
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF355E3B),
      body: SafeArea(
          child: CustomScrollView(
              controller: _scrollController,
              physics: const ClampingScrollPhysics(),
              slivers: [
            appBar(),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    // The builder function returns a ListTile with a title that
                    // displays the index of the current item.
                    (context, index) => Container(
                          height: MediaQuery.of(context).size.height,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  child: SizedBox(
                                    height: 130,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 6,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, right: 10.0),
                                          child: SizedBox(
                                            width: 90,
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                  listImg[index],
                                                  height: 100,
                                                  width: 80,
                                                  fit: BoxFit.contain,
                                                ),
                                                Text(
                                                  lisName[index],
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  overflow: TextOverflow.ellipsis,
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                const Divider(
                                  thickness: 5,
                                  color: Colors.black12,
                                )
                              ]),
                        ),
                    childCount: 1))
          ])),
    );
  }
}
