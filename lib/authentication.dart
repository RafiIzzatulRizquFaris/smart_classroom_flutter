import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth{
  Future<String> signIn(String email, String password);
  Future<String> signUp(String email, String password);
  Future<FirebaseUser> getCurrentUser();
  Future sendEmailVerification();
  Future logOut();
  Future isEmailVerified();
}

class Auth implements BaseAuth{

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await firebaseAuth.currentUser();
    return user;
  }

  @override
  Future isEmailVerified() async {
    FirebaseUser user = await firebaseAuth.currentUser();
    return user.isEmailVerified;
  }

  @override
  Future logOut() {
    return firebaseAuth.signOut();
  }

  @override
  Future sendEmailVerification() async {
    FirebaseUser user = await firebaseAuth.currentUser();
    return user.sendEmailVerification();
  }

  @override
  Future<String> signIn(String email, String password) async {
    AuthResult result = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    return user.email;
  }

  @override
  Future<String> signUp(String email, String password) async {
    AuthResult result = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    return user.email;
  }
}