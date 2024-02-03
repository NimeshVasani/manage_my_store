import 'package:firebase_auth/firebase_auth.dart';
import '../../utils/Resource.dart';

class WebAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Resources<User?>> registerAdmin(
      String name, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Success(_auth.currentUser);
    } catch (e) {
      // Handle registration error
      return Error(e.toString());
    }
  }

  Future<Resources<User>> loginAdmin(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Success(_auth.currentUser!);
    } catch (e) {
      // Handle login error
      return Error(e.toString());
    }
  }


  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<bool> isAuthenticated() async {
    User? user = _auth.currentUser;
    return user != null;
  }
}