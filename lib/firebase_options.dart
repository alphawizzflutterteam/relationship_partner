import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;

      default:
        return android;
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBoq2BNu3kD-36qczc9N96i4iGK1zCFPw8',
    appId: '1:41514283184:android:f1b5651dbce442fb23cb75',
    messagingSenderId: '41514283184',
    projectId: 'relationship-d4fa7',
    storageBucket: 'relationship-d4fa7.appspot.com',
  );

  

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCbNlcjeQww2bJlKzaWtGfLskjSjIGYkzM',
    appId: '1:41514283184:ios:4443f0b882dd01e723cb75',
    messagingSenderId: '41514283184',
    projectId: 'relationship-d4fa7',
    storageBucket: 'relationship-d4fa7.appspot.com',
    iosBundleId: 'com.example.astrologerapp',
  );

}