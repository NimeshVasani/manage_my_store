import 'package:flutter/material.dart';
import 'package:manage_my_store/mobile/ui/screens/profilescreen.dart';
import 'package:manage_my_store/mobile/ui/screens/searchscreen.dart';
import 'package:manage_my_store/model/user.dart';
import 'package:manage_my_store/viewmodels/firestore/mobilefirestoreviewmodel.dart';
import 'package:provider/provider.dart';

import '../widgets/mainscreenwidgets/bottomappbar.dart';
import 'shopscreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final _formKey = GlobalKey<FormState>();

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  late MobileFireStoreViewModel fireStoreViewModel;

  @override
  void initState() {
    super.initState();
    fireStoreViewModel =
        Provider.of<MobileFireStoreViewModel>(context, listen: false);

    // Other initialization logic
  }

  static const List<Widget> _bottomNavScreens = [
    ShopScreen(),
    SearchScreen(),
    ShopScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
            floatingActionButton: SizedBox(
              height: 70,
              width: 70,
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)),
                backgroundColor: Colors.orange,
                onPressed: () async{
                 await fireStoreViewModel.addUserIntoUserList(FirebaseUser("Nimesh", "vasaninimesh0@gmail.com", 'Daizy@1905'));
                },
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
              ),
            ),
            floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
            body: Center(child: _bottomNavScreens.elementAt(selectedIndex)),
            bottomNavigationBar: SafeArea(
                maintainBottomViewPadding: false,
                bottom: false,
                child: BottomAppBar(
                    shape: const CircularNotchedRectangle(),
                    notchMargin: 10.0,
                    height: 85,
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: CustomBottomAppbar(
                        onChanged: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      ),
                    )))));
  }
}

void showPopUpDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Positioned(
                right: -15.0,
                top: -15.0,
                child: InkResponse(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.close,
                      size: 18,
                    ),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      decoration: BoxDecoration(
                          color: Colors.yellow.withOpacity(0.2),
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.grey.withOpacity(0.3)))),
                      child: const Center(
                          child: Text("Contact Me",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: "Helvetica"))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.2))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  width: 30,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              color: Colors.grey
                                                  .withOpacity(0.2)))),
                                  child: Center(
                                      child: Icon(Icons.person,
                                          size: 35,
                                          color: Colors.grey.withOpacity(0.4))),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      hintText: "Name",
                                      contentPadding: EdgeInsets.only(left: 20),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: Colors.black26,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                ),
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.2))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  width: 30,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              color: Colors.grey
                                                  .withOpacity(0.2)))),
                                  child: Center(
                                      child: Icon(Icons.call,
                                          size: 35,
                                          color: Colors.grey.withOpacity(0.4))),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      hintText: "Phone Number",
                                      contentPadding: EdgeInsets.only(left: 20),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: Colors.black26,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                ),
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 60,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xffc9880b),
                                    Color(0xfff77f00),
                                  ])),
                          child: const Center(
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800),
                              )),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState?.save();
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      });
}
