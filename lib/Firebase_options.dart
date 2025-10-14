import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are only supported for Web and Android in this project.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyBtEmQMR7ju-GPRg0pG9_r61pgWpiRyv-8",
    authDomain: "carieer-guide.firebaseapp.com",
    projectId: "carieer-guide",
    storageBucket: "carieer-guide.appspot.com",
    messagingSenderId: "814662697100",
    appId: "1:814662697100:web:c5f608a013c74c95ef7ba9",
    measurementId: null, // optional
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyBtEmQMR7ju-GPRg0pG9_r61pgWpiRyv-8",
    appId:
        "1:814662697100:android:3b9d02c7a6a91f90", // ✅ Replace with your real App ID from google-services.json
    messagingSenderId: "814662697100",
    projectId: "carieer-guide",
    storageBucket: "carieer-guide.appspot.com",
  );
}
