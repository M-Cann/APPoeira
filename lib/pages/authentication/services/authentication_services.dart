import 'package:firebase_auth/firebase_auth.dart';

class Authentication{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp(String email, String password) async {
    firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logIn(String email, String password) async {
    firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logOut() async {
    firebaseAuth.signOut();
  }
}