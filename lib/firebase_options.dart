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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDL4D_YSgDtO-sc_mMA2nAGpJ8qgiuDDhw',
    appId: '1:569941663703:android:c00bbaece314616dc67592',
    messagingSenderId: '569941663703',
    projectId: 'educ-28543',
    databaseURL: 'https://educ-28543-default-rtdb.firebaseio.com',
    storageBucket: 'educ-28543.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDaM0UnKVRzUzngXNUSd50chedxDX_fwXE',
    appId: '1:569941663703:ios:cdfa33ca50f83e56c67592',
    messagingSenderId: '569941663703',
    projectId: 'educ-28543',
    databaseURL: 'https://educ-28543-default-rtdb.firebaseio.com',
    storageBucket: 'educ-28543.appspot.com',
    iosClientId: '569941663703-pna7b1pp6sr6er2onqlcol01aj7edkm1.apps.googleusercontent.com',
    iosBundleId: 'br.com.luanferro.educ',
  );
}