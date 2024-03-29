// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAUW0-1VlqcoO5lBmWDpEFxOUDHMgp6teE',
    appId: '1:627268715713:web:109701dd260dd97394c040',
    messagingSenderId: '627268715713',
    projectId: 'new-flutter-projects',
    authDomain: 'new-flutter-projects.firebaseapp.com',
    databaseURL: 'https://new-flutter-projects-default-rtdb.firebaseio.com',
    storageBucket: 'new-flutter-projects.appspot.com',
    measurementId: 'G-E48S8B516D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCBAggRG6ndINuURpMIoe2UnQOkhdVX13c',
    appId: '1:627268715713:android:f0249136fd9a01b094c040',
    messagingSenderId: '627268715713',
    projectId: 'new-flutter-projects',
    databaseURL: 'https://new-flutter-projects-default-rtdb.firebaseio.com',
    storageBucket: 'new-flutter-projects.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCI4xIxT0F3yuAKiZ8fsWiG_9KEuRWgQZ4',
    appId: '1:627268715713:ios:4507cd41e93ed2e394c040',
    messagingSenderId: '627268715713',
    projectId: 'new-flutter-projects',
    databaseURL: 'https://new-flutter-projects-default-rtdb.firebaseio.com',
    storageBucket: 'new-flutter-projects.appspot.com',
    iosBundleId: 'com.example.manageMyStore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCI4xIxT0F3yuAKiZ8fsWiG_9KEuRWgQZ4',
    appId: '1:627268715713:ios:4c0c989472510ca094c040',
    messagingSenderId: '627268715713',
    projectId: 'new-flutter-projects',
    databaseURL: 'https://new-flutter-projects-default-rtdb.firebaseio.com',
    storageBucket: 'new-flutter-projects.appspot.com',
    iosBundleId: 'com.example.manageMyStore.RunnerTests',
  );
}
