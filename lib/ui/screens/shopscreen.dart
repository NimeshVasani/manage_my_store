import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/authentication/authviewmodel.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  late AuthViewModel authViewModel;

  @override
  void initState() {
    super.initState();
    authViewModel = Provider.of<AuthViewModel>(context, listen: false);

    // Other initialization logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(

        child: Center(
          child: ElevatedButton(
            onPressed:  () {
              authViewModel.signOut();
        
            },
            child: Text('logout'),
          ),
        ),
      ),
    );
  }
}
