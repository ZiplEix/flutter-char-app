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
    apiKey: 'AIzaSyBkd8TP8VVHp98wi4yQAhBbaxc07t4ITHg',
    appId: '1:655138975273:web:e84b3d67879d3f2f08b638',
    messagingSenderId: '655138975273',
    projectId: 'chat-app-c74be',
    authDomain: 'chat-app-c74be.firebaseapp.com',
    storageBucket: 'chat-app-c74be.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDIGWwJq1y4ckXhn_KpoJcCpxpNulY4zI0',
    appId: '1:655138975273:android:2acae34eaca189c908b638',
    messagingSenderId: '655138975273',
    projectId: 'chat-app-c74be',
    storageBucket: 'chat-app-c74be.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCb_RuxLtvLW5t0RD1mkqa1PpusgWxcHxE',
    appId: '1:655138975273:ios:c4141abdde4dc8c508b638',
    messagingSenderId: '655138975273',
    projectId: 'chat-app-c74be',
    storageBucket: 'chat-app-c74be.appspot.com',
    iosClientId: '655138975273-uludr6sakmj0grgesoml70scrfkba388.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterChatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCb_RuxLtvLW5t0RD1mkqa1PpusgWxcHxE',
    appId: '1:655138975273:ios:259f5a5a0a58e3d008b638',
    messagingSenderId: '655138975273',
    projectId: 'chat-app-c74be',
    storageBucket: 'chat-app-c74be.appspot.com',
    iosClientId: '655138975273-rtrgqghedrv5lf90a0hkg84lqkktmrn2.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterChatApp.RunnerTests',
  );
}
