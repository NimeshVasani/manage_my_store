import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manage_my_store/ui/widgets/customtext.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Spacer(
                  flex: 12,
                ),
                customTextView(
                    'Account Detail', 18, FontWeight.w600, Colors.black, 1),
                const Spacer(
                  flex: 9,
                ),
                const Icon(Icons.edit),
                const SizedBox(
                  width: 20.0,
                )
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              clipBehavior: Clip.hardEdge,
                height: 100,
                width: 100,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: Image.asset('assets/images/vegitables_deals.jpg',fit: BoxFit.cover,)),
            const SizedBox(height: 5,),
            customTextView('Nimesh Vasani', 20, FontWeight.w600, Colors.black, 1),
            customTextView('vasaninimesh@gmail.com', 18, FontWeight.normal, Colors.black54, 1),
            customTextView('+1 (647) 893-9081', 18, FontWeight.normal, Colors.black54, 1),
            const SizedBox(height: 5,),
            const Divider(thickness: 3,color: Colors.black45,)
          ],
        ),
      ),
    ));
  }
}
