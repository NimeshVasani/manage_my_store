import 'package:flutter/material.dart';
import 'package:manage_my_store/mobile/ui/widgets/shop_screen_widgets/app_bar.dart';
import 'package:manage_my_store/model/web/item.dart';
import 'package:provider/provider.dart';

import '../../../model/web/store.dart';
import '../../../utils/Resource.dart';
import '../../../viewmodels/firestore/mobile_firestore_view_model.dart';
import '../widgets/shop_screen_widgets/custom_deals_layout.dart';
import '../widgets/shop_screen_widgets/custom_grid.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  late ScrollController _scrollController;
  int selectedIndex = 0;
  late MobileFireStoreViewModel fireStoreViewModel;
  Map<String, String> stores = {};
  FirebaseStore? currentStore;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    fireStoreViewModel =
        Provider.of<MobileFireStoreViewModel>(context, listen: false);
    getAllStores(fireStoreViewModel);
    if (stores.keys.isNotEmpty) getStore(stores.keys.first, fireStoreViewModel);
  }

  List<FirebaseItem> currentItems = [];

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
                stores: stores.values.toList().isEmpty
                    ? ["No Stores Available"]
                    : stores.values.toList(),
                onChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                    getCurrentItem(selectedIndex);
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
                                      ? currentStore != null
                                          ? CustomDealsLayout(
                                              items: currentStore!.items!,
                                            )
                                          : Container(height: MediaQuery.of(context).size.height-400,)
                                      : currentItems.isNotEmpty
                                          ? CustomGridLayout(
                                              items: currentItems,
                                            )
                                          : Container(height: MediaQuery.of(context).size.height-400,),
                                  const SizedBox(
                                    height: 30,
                                  )
                                ]),
                          ),
                      childCount: 1))
            ])));
  }

  Future<void> getAllStores(MobileFireStoreViewModel fireStoreViewModel) async {
    var response = await fireStoreViewModel.getAllStoreNamesWithIds();

    switch (response.runtimeType) {
      case const (Success<Map<String, String>>):
        setState(() {
          stores = response.data!;
          if (stores.keys.isNotEmpty) {
            getStore(stores.keys.first, fireStoreViewModel);
          }
        });
        break;
      default:
        setState(() {
          stores = {};
        });
        break;
    }
  }

  Future<void> getStore(
      String storeId, MobileFireStoreViewModel fireStoreViewModel) async {
    var response = await fireStoreViewModel.getStore(storeId);

    switch (response.runtimeType) {
      case const (Success<FirebaseStore>):
        setState(() {
          currentStore = response.data;
          getCurrentItem(selectedIndex);
        });
        break;
      case const (Error<String>):
        {
          setState(() {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content:
                      Text('Error fetching store data: ${response.message}')),
            );
            currentStore = null;
          });
          break;
        }
      default:
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    'Error fetching store data:  ${response.message.toString()}')),
          );
          currentStore = null;
        });
        break;
    }
  }

  void getCurrentItem(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        setState(() {
          currentItems = currentStore!.items!
              .where((item) => item.category == "Deals")
              .toList();
        });
      case 1:
        setState(() {
          currentItems = currentStore!.items!
              .where((item) => item.category == "General")
              .toList();
        });
      case 2:
        setState(() {
          currentItems = currentStore!.items!
              .where((item) => item.category == "Fruits")
              .toList();
        });
      case 3:
        setState(() {
          currentItems = currentStore!.items!
              .where((item) => item.category == "Vegetables")
              .toList();
        });
      case 4:
        setState(() {
          currentItems = currentStore!.items!
              .where((item) => item.category == "Asian")
              .toList();
        });
      case 5:
        setState(() {
          currentItems = currentStore!.items!
              .where((item) => item.category == "American")
              .toList();
        });
      case 6:
        setState(() {
          currentItems = currentStore!.items!
              .where((item) => item.category == "Custom")
              .toList();
        });
    }
  }
}
