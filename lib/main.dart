import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flavour_track/pages/homePage.dart';
import 'package:flavour_track/signIn.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseOptions firebaseOptions = const FirebaseOptions(
    apiKey: "AIzaSyC99mGARqL_jj_xT-8I3CEi8R_4GXGG34E",
    appId: '1:957596927074:android:aaca3999f11660d1483d3b',
    messagingSenderId: '',
    projectId: 'flavour-track-757c6',
  );

  await Firebase.initializeApp(options: firebaseOptions);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: currentUser != null ? const HomePage() : const SignIn()),
    );
  }
}
