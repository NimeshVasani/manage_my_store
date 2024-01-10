import 'package:flutter/foundation.dart';

import '../../model/User.dart';
import '../../repositories/authentication/AuthRepository.dart';
import '../../utils/Resource.dart';


class AuthViewModel with ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  Future<Resources<FirebaseUser?>> registerWithEmailAndPassword(
      String name, String email, String password) async {
    return await _authRepository.registerWithEmailAndPassword(
        name, email, password);
  }

  Future<Resources<FirebaseUser?>> loginWithEmailAndPassword(
      String email, String password) async {
    return await _authRepository.loginWithEmailAndPassword(
         email, password);
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
  }
  Future<bool> checkAuthenticationStatus() async {
    _isAuthenticated = await _authRepository.isAuthenticated();
    return _isAuthenticated;
  }

}
