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
    apiKey: 'AIzaSyCa_kiSomZvt3nqp7TnCKLUFJuhUwdRx4E',
    appId: '1:248540491269:web:e191499ed4bae3823bb66c',
    messagingSenderId: '248540491269',
    projectId: 'fir-ders-ae962',
    authDomain: 'fir-ders-ae962.firebaseapp.com',
    storageBucket: 'fir-ders-ae962.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOUOfjVTt12OsGZUJ4qjC_sB2e2XfkWSA',
    appId: '1:248540491269:android:39021cb18f2d66073bb66c',
    messagingSenderId: '248540491269',
    projectId: 'fir-ders-ae962',
    storageBucket: 'fir-ders-ae962.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCom_7zQtRFjBQs0gCOOqvU3FpmUe2rekQ',
    appId: '1:248540491269:ios:cc31de475a20ab883bb66c',
    messagingSenderId: '248540491269',
    projectId: 'fir-ders-ae962',
    storageBucket: 'fir-ders-ae962.firebasestorage.app',
    iosBundleId: 'com.example.flutterFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCom_7zQtRFjBQs0gCOOqvU3FpmUe2rekQ',
    appId: '1:248540491269:ios:cc31de475a20ab883bb66c',
    messagingSenderId: '248540491269',
    projectId: 'fir-ders-ae962',
    storageBucket: 'fir-ders-ae962.firebasestorage.app',
    iosBundleId: 'com.example.flutterFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCa_kiSomZvt3nqp7TnCKLUFJuhUwdRx4E',
    appId: '1:248540491269:web:0b3a36d3a437dd233bb66c',
    messagingSenderId: '248540491269',
    projectId: 'fir-ders-ae962',
    authDomain: 'fir-ders-ae962.firebaseapp.com',
    storageBucket: 'fir-ders-ae962.firebasestorage.app',
  );

}