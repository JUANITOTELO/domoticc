import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'deslizable.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'pr1_web.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    runApp(DWeb());
  } else {
    final FirebaseApp app = await Firebase.initializeApp(
      name: "domoticc",
      options: FirebaseOptions(
          apiKey: "AIzaSyAPOFoXfKnGl-Y-utGSRF4XeeFcMZkSfE8",
          authDomain: "macc-domoticc.firebaseapp.com",
          databaseURL: "https://macc-domoticc.firebaseio.com",
          projectId: "macc-domoticc",
          storageBucket: "macc-domoticc.appspot.com",
          messagingSenderId: "852333646886",
          appId: "1:852333646886:android:b7fb468b56eb00246202e7",
          measurementId: "G-SD848QB5QP"),
    );
    runApp(Deslizable(
      app: app,
    ));
  }
}
