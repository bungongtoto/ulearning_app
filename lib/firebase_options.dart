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
    apiKey: 'AIzaSyBM5N8rCfp0aLnG74hs8R_B_pMYFzV-pFQ',
    appId: '1:872168124809:web:700202beabd3fd6242b158',
    messagingSenderId: '872168124809',
    projectId: 'ulearning-app-22bc8',
    authDomain: 'ulearning-app-22bc8.firebaseapp.com',
    storageBucket: 'ulearning-app-22bc8.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAhc7LxBIVU5tRtPewo7Fchu9BDYoYTgi0',
    appId: '1:872168124809:android:2061d3935d856ba842b158',
    messagingSenderId: '872168124809',
    projectId: 'ulearning-app-22bc8',
    storageBucket: 'ulearning-app-22bc8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1rVTwWGOrWDTEcl18F2GWHlb5WqW7FhA',
    appId: '1:872168124809:ios:1544383a06d97c0742b158',
    messagingSenderId: '872168124809',
    projectId: 'ulearning-app-22bc8',
    storageBucket: 'ulearning-app-22bc8.appspot.com',
    iosBundleId: 'com.example.ulearningApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC1rVTwWGOrWDTEcl18F2GWHlb5WqW7FhA',
    appId: '1:872168124809:ios:58e356aa0a9e51ba42b158',
    messagingSenderId: '872168124809',
    projectId: 'ulearning-app-22bc8',
    storageBucket: 'ulearning-app-22bc8.appspot.com',
    iosBundleId: 'com.example.ulearningApp.RunnerTests',
  );
}