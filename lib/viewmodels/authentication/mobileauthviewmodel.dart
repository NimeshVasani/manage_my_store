import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../repositories/authentication/mobileauthrepository.dart';
import '../../utils/Resource.dart';


class MobileAuthViewModel with ChangeNotifier {
  final MobileAuthRepository _authRepository = MobileAuthRepository();

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  Future<Resources<User?>> registerWithEmailAndPassword(
      String name, String email, String password) async {
    return await _authRepository.registerWithEmailAndPassword(
        name, email, password);
  }

  Future<Resources<User?>> loginWithEmailAndPassword(
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