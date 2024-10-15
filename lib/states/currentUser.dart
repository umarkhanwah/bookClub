import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CurrentUser extends ChangeNotifier {
  String _uid = "";
  String _email = "";

  String get getUid => _uid;
  String get getEmail => _email;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signUpUser(String email, String password) async {
    bool retVal = false;
    try {
      // AuthResult class is changed into UserCredential
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Check if The User is Added Succesfully
      if (authResult.user != null) {
        retVal = true;
      }
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<bool> loginUser(String email, String password) async {
    bool retVal = false;
    try {
      // AuthResult class is changed into UserCredential
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      // Check if The User is Added Succesfully
      final user = authResult.user;
      if (user != null) {
        _uid = user.uid;
        _email = user.email!;
        retVal = true;
      }
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
