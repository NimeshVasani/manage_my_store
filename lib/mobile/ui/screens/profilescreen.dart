import 'package:flutter/material.dart';

import '../widgets/profilescreenwidgets/customappbar.dart';
import '../widgets/profilescreenwidgets/settinglist.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const CustomAppBar(),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        SettingList(),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                childCount: 1))
      ],
    ));
  }
}