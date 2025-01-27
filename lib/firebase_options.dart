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
    apiKey: 'AIzaSyBN58wrPX_ScE6ujIuwhhA2y5Ge2CERmGk',
    appId: '1:460204442539:web:8566c1a623c80f22afc8ee',
    messagingSenderId: '460204442539',
    projectId: 'crud-cacd2',
    authDomain: 'crud-cacd2.firebaseapp.com',
    storageBucket: 'crud-cacd2.appspot.com',
    measurementId: 'G-3ZF4PR0TEB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAXDmkCxoFfiK6uNjKqcrb_gPLlInMiXpg',
    appId: '1:460204442539:android:4a5939bd0f007f84afc8ee',
    messagingSenderId: '460204442539',
    projectId: 'crud-cacd2',
    storageBucket: 'crud-cacd2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCb96_bOdK7e2LtLhk6cLZoigi87yPqyPE',
    appId: '1:460204442539:ios:d971723abfcd8b21afc8ee',
    messagingSenderId: '460204442539',
    projectId: 'crud-cacd2',
    storageBucket: 'crud-cacd2.appspot.com',
    iosBundleId: 'com.example.firebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCb96_bOdK7e2LtLhk6cLZoigi87yPqyPE',
    appId: '1:460204442539:ios:d971723abfcd8b21afc8ee',
    messagingSenderId: '460204442539',
    projectId: 'crud-cacd2',
    storageBucket: 'crud-cacd2.appspot.com',
    iosBundleId: 'com.example.firebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBN58wrPX_ScE6ujIuwhhA2y5Ge2CERmGk',
    appId: '1:460204442539:web:1a911639aea66353afc8ee',
    messagingSenderId: '460204442539',
    projectId: 'crud-cacd2',
    authDomain: 'crud-cacd2.firebaseapp.com',
    storageBucket: 'crud-cacd2.appspot.com',
    measurementId: 'G-QERJX8R68F',
  );
}
