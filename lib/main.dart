import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manage_my_store/viewmodels/authentication/mobile_auth_view_model.dart';
import 'package:manage_my_store/viewmodels/authentication/web_auth_view_model.dart';
import 'package:manage_my_store/viewmodels/firestore/mobile_firestore_view_model.dart';
import 'package:manage_my_store/viewmodels/firestore/web_fire_store_view_model.dart';
import 'package:manage_my_store/viewmodels/storage/web_storage_view_model.dart';
import 'package:manage_my_store/web/ui/screens/admin_login.dart';
import 'package:manage_my_store/web/ui/screens/admin_main_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'mobile/ui/screens/login_option_screen.dart';
import 'mobile/ui/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter binding is initialized.

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        //Mobile change notifier
        ChangeNotifierProvider(
          create: (context) => MobileAuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MobileFireStoreViewModel(),
        ),

        //web change notifier
        ChangeNotifierProvider(
          create: (context) => WebAuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => WebFireStoreViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => WebStorageViewModel(),
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
      future: Provider.of<MobileAuthViewModel>(context, listen: false)
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
      future: Provider.of<MobileAuthViewModel>(context, listen: false)
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
            title: 'Manage My Store',
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
