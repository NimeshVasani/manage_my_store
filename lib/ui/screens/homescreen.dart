import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/authentication/authviewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: Center(
        child: ElevatedButton(
          onPressed:  () {
            authViewModel.signOut();

          },
          child: Text('logout'),
        ),
      ),
    );
  }
}
