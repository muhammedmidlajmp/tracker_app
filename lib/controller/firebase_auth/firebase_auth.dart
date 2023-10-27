import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;
// Sign up with email and password
  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
 
// Sign in with email and password
  Future<User?> signIn(String email, String password) async {
     try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

// Sign out
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
