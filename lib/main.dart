import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:manage_my_store/ui/screens/loginOptionScreen.dart';
import 'package:manage_my_store/ui/screens/loginscreen.dart';
import 'package:manage_my_store/viewmodels/authentication/authviewmodel.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GetIt getIt = GetIt.instance;
  getIt.registerLazySingleton<AuthViewModel>(() => AuthViewModel());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),

        ),

      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginOptionsScreen(),
    );
  }
}
