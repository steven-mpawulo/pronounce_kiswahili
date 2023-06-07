import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  dynamic error;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        error = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        error = 'The account already exists for that email.';
      }
    } catch (e) {
      error = e;
      print(e.toString());
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;
      return user;
    } on FirebaseAuthException catch (e) {
      if(e.code == 'user-not-found'){
        error = 'No user found for that email';
      } else if (e.code == 'wrong-password'){
        error = 'Wrong password provided for that user.';
      }
    } catch (e) {
      error = e;
      print(e.toString());
    }
    return null;
  }

  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      error = e;
      print(e.toString());
    }
  }
}
