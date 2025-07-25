// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyD29XTICbITK3AWSmXJWEe6iz-f3WUoS3M',
    appId: '1:400414944419:web:a836c83f3532e9c3c76316',
    messagingSenderId: '400414944419',
    projectId: 'udemy-egitim-2-1b400',
    authDomain: 'udemy-egitim-2-1b400.firebaseapp.com',
    databaseURL: 'https://udemy-egitim-2-1b400-default-rtdb.firebaseio.com',
    storageBucket: 'udemy-egitim-2-1b400.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAtkqBDgHPeGtZj3IuKqrRHHFHP_bs6Yqo',
    appId: '1:400414944419:android:f3097de7aef5eb5fc76316',
    messagingSenderId: '400414944419',
    projectId: 'udemy-egitim-2-1b400',
    databaseURL: 'https://udemy-egitim-2-1b400-default-rtdb.firebaseio.com',
    storageBucket: 'udemy-egitim-2-1b400.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBThcSGpJqrzdrmkqwy6FqwqUJf-JHu7Gk',
    appId: '1:400414944419:ios:9f7c5f59d77aba93c76316',
    messagingSenderId: '400414944419',
    projectId: 'udemy-egitim-2-1b400',
    databaseURL: 'https://udemy-egitim-2-1b400-default-rtdb.firebaseio.com',
    storageBucket: 'udemy-egitim-2-1b400.firebasestorage.app',
    iosBundleId: 'com.example.flutterFirebaseKullanimi2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBThcSGpJqrzdrmkqwy6FqwqUJf-JHu7Gk',
    appId: '1:400414944419:ios:9f7c5f59d77aba93c76316',
    messagingSenderId: '400414944419',
    projectId: 'udemy-egitim-2-1b400',
    databaseURL: 'https://udemy-egitim-2-1b400-default-rtdb.firebaseio.com',
    storageBucket: 'udemy-egitim-2-1b400.firebasestorage.app',
    iosBundleId: 'com.example.flutterFirebaseKullanimi2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD29XTICbITK3AWSmXJWEe6iz-f3WUoS3M',
    appId: '1:400414944419:web:d183110ff9fb0d15c76316',
    messagingSenderId: '400414944419',
    projectId: 'udemy-egitim-2-1b400',
    authDomain: 'udemy-egitim-2-1b400.firebaseapp.com',
    databaseURL: 'https://udemy-egitim-2-1b400-default-rtdb.firebaseio.com',
    storageBucket: 'udemy-egitim-2-1b400.firebasestorage.app',
  );
}
