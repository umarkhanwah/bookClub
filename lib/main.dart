import 'package:book_club/screens/login/login.dart';
import 'package:book_club/states/currentUser.dart';
import 'package:book_club/utils/ourTheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDtmL5HfKcBu71hPxD26kF5yGFq8xn9-sw",
        authDomain: "bookclub-5b239.firebaseapp.com",
        projectId: "bookclub-5b239",
        storageBucket: "bookclub-5b239.appspot.com",
        messagingSenderId: "939481362724",
        appId: "1:939481362724:web:6ffb722678d856741c43b1",
        measurementId: "G-MSFYTYESCH"),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: OurTheme().buildTheme(),
        home: const OurLogin(),
      ),
    );
  }
}
