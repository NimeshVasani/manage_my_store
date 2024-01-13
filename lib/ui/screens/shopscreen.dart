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
    return Scaffold(
      backgroundColor: Colors.green,
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
                          child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ElevatedButton(onPressed: (){
                                  authViewModel.signOut();
                                }, child: Text('data'))
                              ]),
                        ),

                    childCount: 1))
          ])),
    );
  }
}
