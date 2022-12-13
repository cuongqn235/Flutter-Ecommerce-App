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
    apiKey: 'AIzaSyBRAXTAfBUtfZSDYJ_ka4CDRnAhL1rwk7U',
    appId: '1:671623059146:web:0165a91db8bc0639270633',
    messagingSenderId: '671623059146',
    projectId: 'ecommerce-4fbf3',
    authDomain: 'ecommerce-4fbf3.firebaseapp.com',
    storageBucket: 'ecommerce-4fbf3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA5YMS0wAgxgUPIG8t6gWJIC7EUZ8y2gkA',
    appId: '1:671623059146:android:e544ad13f69b9c6f270633',
    messagingSenderId: '671623059146',
    projectId: 'ecommerce-4fbf3',
    storageBucket: 'ecommerce-4fbf3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1sY1EjFH-UePSIoWyRQ2I706nJouvnjA',
    appId: '1:671623059146:ios:aa4d25e47a7adbe4270633',
    messagingSenderId: '671623059146',
    projectId: 'ecommerce-4fbf3',
    storageBucket: 'ecommerce-4fbf3.appspot.com',
    iosClientId: '671623059146-71ka5o9r9rlrk3ums2dng9octt1avtpn.apps.googleusercontent.com',
    iosBundleId: 'com.example.bandongho',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD1sY1EjFH-UePSIoWyRQ2I706nJouvnjA',
    appId: '1:671623059146:ios:aa4d25e47a7adbe4270633',
    messagingSenderId: '671623059146',
    projectId: 'ecommerce-4fbf3',
    storageBucket: 'ecommerce-4fbf3.appspot.com',
    iosClientId: '671623059146-71ka5o9r9rlrk3ums2dng9octt1avtpn.apps.googleusercontent.com',
    iosBundleId: 'com.example.bandongho',
  );
}