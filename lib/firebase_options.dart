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
    apiKey: 'AIzaSyD5Jc5lYLr3In9i8wUccV9RZoSWnppMhXo',
    appId: '1:401173013508:web:456e5debe556f6fabe8151',
    messagingSenderId: '401173013508',
    projectId: 'fellowship-2023--team-1',
    authDomain: 'fellowship-2023--team-1.firebaseapp.com',
    storageBucket: 'fellowship-2023--team-1.appspot.com',
    measurementId: 'G-X5V0GZG5QP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDIIhwEyX8VNxxXWHO0ycm9k5lbv6k18xE',
    appId: '1:401173013508:android:41b4163cc9e447e1be8151',
    messagingSenderId: '401173013508',
    projectId: 'fellowship-2023--team-1',
    storageBucket: 'fellowship-2023--team-1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAm2GsvNPZuUTUNdvnGUwlOWuR3-2yGvrk',
    appId: '1:401173013508:ios:aae0369f28705376be8151',
    messagingSenderId: '401173013508',
    projectId: 'fellowship-2023--team-1',
    storageBucket: 'fellowship-2023--team-1.appspot.com',
    iosClientId: '401173013508-q4n8k4ugksmfhcqd8lfaqj2shs465t2b.apps.googleusercontent.com',
    iosBundleId: 'com.example.fellowship',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAm2GsvNPZuUTUNdvnGUwlOWuR3-2yGvrk',
    appId: '1:401173013508:ios:aae0369f28705376be8151',
    messagingSenderId: '401173013508',
    projectId: 'fellowship-2023--team-1',
    storageBucket: 'fellowship-2023--team-1.appspot.com',
    iosClientId: '401173013508-q4n8k4ugksmfhcqd8lfaqj2shs465t2b.apps.googleusercontent.com',
    iosBundleId: 'com.example.fellowship',
  );
}
