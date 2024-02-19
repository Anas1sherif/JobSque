import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthSurvice {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User?> signupwithEmailAndPassword(
      String email, String password, String username) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Some error");
    }
    return null;
  }

  Future<User?> signinwithEmailAndPssword(
      String email, String password, String username) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Some error");
    }
    return null;
  }
}
