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
    apiKey: 'AIzaSyA0ZEkKT2JD27FvuMerBwK0o95cYbB8kTc',
    appId: '1:959733048227:web:1d6e3d3bd2002059be7016',
    messagingSenderId: '959733048227',
    projectId: 'myshop-ecommerce-3ebaa',
    authDomain: 'myshop-ecommerce-3ebaa.firebaseapp.com',
    storageBucket: 'myshop-ecommerce-3ebaa.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAq4GkmbZXf9LThoL2S1N_DXYeWkMyCIdI',
    appId: '1:959733048227:android:c64874f1955c6d12be7016',
    messagingSenderId: '959733048227',
    projectId: 'myshop-ecommerce-3ebaa',
    storageBucket: 'myshop-ecommerce-3ebaa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZi58XMRYSzY0J9p5RNzJmkusO9BKNt5c',
    appId: '1:959733048227:ios:121f195bc6a85fbebe7016',
    messagingSenderId: '959733048227',
    projectId: 'myshop-ecommerce-3ebaa',
    storageBucket: 'myshop-ecommerce-3ebaa.appspot.com',
    iosBundleId: 'com.example.myshop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZi58XMRYSzY0J9p5RNzJmkusO9BKNt5c',
    appId: '1:959733048227:ios:8eec828423d2e3c2be7016',
    messagingSenderId: '959733048227',
    projectId: 'myshop-ecommerce-3ebaa',
    storageBucket: 'myshop-ecommerce-3ebaa.appspot.com',
    iosBundleId: 'com.example.myshop.RunnerTests',
  );
}
