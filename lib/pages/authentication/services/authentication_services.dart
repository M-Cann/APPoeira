import 'package:appoeira/common_functions/developer_tools.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp(String email, String password, Function() successful) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      successful();
    } on FirebaseAuthException catch (e) {
      Logger.red.log('Kayıt Başarısız ${e.message}');
    }
  }

  Future<void> logIn(String email, String password, Function(String? token) successful) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password).then((value) {
        value.user?.getIdToken().then((value) {
          successful(value);
          Logger.green.log('Token $value');
        },);
      },);
    } on FirebaseAuthException catch (e) {
      Logger.red.log('Giriş Başarısız ${e.message}');
    }
  }

  Future<void> logInWithToken(String token, Function() successful) async {
    Logger.blue.log(firebaseAuth.currentUser?.email);
    Logger.green.log(token);
    try {
      await firebaseAuth.signInWithCustomToken(token);
      successful();
    } on FirebaseAuthException catch (e) {
      Logger.red.log('Token İle Giriş Başarısız ${e}');
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}