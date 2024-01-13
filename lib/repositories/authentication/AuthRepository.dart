import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../model/User.dart';
import '../../utils/Resource.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<Resources<FirebaseUser?>> registerWithEmailAndPassword(String name,
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Success(FirebaseUser(name, email, password));
    } catch (e) {
      // Handle registration error
      return Error(e.toString());
    }

  }

  Future<Resources<FirebaseUser?>> loginWithEmailAndPassword(String email,
      String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Success(FirebaseUser(
          userCredential.additionalUserInfo?.username, email, password));
    } catch (e) {
      // Handle login error
      return Error(e.toString());
    }
  }

  Future<UserCredential> signUpWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<bool> isAuthenticated() async {
    User? user = _auth.currentUser;
    return user != null;
  }
}