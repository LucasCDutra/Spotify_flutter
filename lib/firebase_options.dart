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
    apiKey: 'AIzaSyCPuT7FvqYs2Jj05PVIKcCdWj8fVo0REwQ',
    appId: '1:872326349343:web:0a4d5298ad8319b1df0b2a',
    messagingSenderId: '872326349343',
    projectId: 'spotifyflutterproject',
    authDomain: 'spotifyflutterproject.firebaseapp.com',
    storageBucket: 'spotifyflutterproject.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAPXLd7RVTUU7v4NP4tvQT-yJgsYJ3ziYo',
    appId: '1:872326349343:android:310c733ad3890fb8df0b2a',
    messagingSenderId: '872326349343',
    projectId: 'spotifyflutterproject',
    storageBucket: 'spotifyflutterproject.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDH4zM8mQsu6Yi0UKlPDFJr9dJLYpfjvyo',
    appId: '1:872326349343:ios:20d67baf3049fea6df0b2a',
    messagingSenderId: '872326349343',
    projectId: 'spotifyflutterproject',
    storageBucket: 'spotifyflutterproject.firebasestorage.app',
    iosBundleId: 'com.example.spotifyFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDH4zM8mQsu6Yi0UKlPDFJr9dJLYpfjvyo',
    appId: '1:872326349343:ios:20d67baf3049fea6df0b2a',
    messagingSenderId: '872326349343',
    projectId: 'spotifyflutterproject',
    storageBucket: 'spotifyflutterproject.firebasestorage.app',
    iosBundleId: 'com.example.spotifyFlutter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCPuT7FvqYs2Jj05PVIKcCdWj8fVo0REwQ',
    appId: '1:872326349343:web:48d0c3a4743eaccbdf0b2a',
    messagingSenderId: '872326349343',
    projectId: 'spotifyflutterproject',
    authDomain: 'spotifyflutterproject.firebaseapp.com',
    storageBucket: 'spotifyflutterproject.firebasestorage.app',
  );
}
