import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show kIsWeb, defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      // return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        // return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBAdv4tSJJtWdCaBhqwupPju4Dc5EXsujc',
    appId: '1:1066246252773:android:ea7b66bbbd16df114c8c0c',
    messagingSenderId: '1066246252773',
    projectId: 'eshop-4cf83',
    storageBucket: 'eshop-4cf83.appspot.com',
  );
}
