import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_my_store/mobile/ui/widgets/custom_text.dart';
import 'package:manage_my_store/web/ui/widgets/profile_settings_widgets/profile_settings_drawer.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({super.key});

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
        ),
        customTextView(
            "Account Settings", 30, FontWeight.w600, Colors.black87, 1,
            textAlign: TextAlign.left),
        customTextView("Change user name, password and many more", 20,
            FontWeight.w500, Colors.black54, 1,
            textAlign: TextAlign.left),
        const SizedBox(
          height: 50,
        ),
        Card(
            elevation: 2.0,
            surfaceTintColor: Colors.transparent,
            color: Colors.white,
            margin: EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ProfileSettingsDrawer(onValueChange: (int index) {}),
                ),
                const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: []),
              ],
            ))
      ],
    );
  }
}
