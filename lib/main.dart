import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manage_my_store/viewmodels/authentication/authviewmodel.dart';
import 'package:manage_my_store/viewmodels/firestore/firestoreviewmodel.dart';
import 'package:manage_my_store/web/ui/screens/adminlogin.dart';
import 'package:manage_my_store/web/ui/screens/adminmainscreen.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'mobile/ui/screens/loginoptionscreen.dart';
import 'mobile/ui/screens/mainscreen.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter binding is initialized.

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => FireStoreViewModel(),
        ),
      ],
      child: !kIsWeb ? const MyApp() : const MyWebApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return FutureBuilder<bool>(
      future: Provider.of<AuthViewModel>(context, listen: false)
          .checkAuthenticationStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While checking authentication status, show a loading indicator.
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle the error.
          return const LoginOptionsScreen();
        } else {
          // Use the authentication status to determine the initial route.
          bool isAuthenticated = snapshot.data ?? false;

          return MaterialApp(
            title: 'My Grocery Store',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            initialRoute: isAuthenticated ? '/main' : '/login',
            routes: {
              '/main': (context) => const MainScreen(),
              '/login': (context) => const LoginOptionsScreen(),
            },
          );
        }
      },
    );
  }
}

class MyWebApp extends StatelessWidget {
  const MyWebApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: Provider.of<AuthViewModel>(context, listen: false)
          .checkAuthenticationStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While checking authentication status, show a loading indicator.
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle the error.
          return const LoginOptionsScreen();
        } else {
          // Use the authentication status to determine the initial route.
          bool isAuthenticated = snapshot.data ?? false;

          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            initialRoute: isAuthenticated ? '/main' : '/login',
            routes: {
              '/main': (context) => const AdminMainScreen(),
              '/login': (context) => const AdminLoginScreen(),
            },
          );
        }
      },
    );
  }
}
