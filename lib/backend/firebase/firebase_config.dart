import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAyBS_B5OjeVkbXuioh0qv2ShIkfPVtLFg",
            authDomain: "voka-note.firebaseapp.com",
            projectId: "voka-note",
            storageBucket: "voka-note.firebasestorage.app",
            messagingSenderId: "327832564227",
            appId: "1:327832564227:web:f178c107a3d04723ddd436",
            measurementId: "G-1WQFB0TZ6V"));
  } else {
    await Firebase.initializeApp();
  }
}
