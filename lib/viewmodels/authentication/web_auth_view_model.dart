import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../repositories/authentication/webauthrepository.dart';
import '../../utils/Resource.dart';

class WebAuthViewModel with ChangeNotifier {
  final WebAuthRepository _authRepository = WebAuthRepository();

  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Future<Resources<User?>> registerAdmin(
      String name, String email, String password) async {
    return await _authRepository.registerAdmin(name, email, password);
  }

  Future<Resources<User?>> loginAdmin(
      String email, String password) async {
    return await _authRepository.loginAdmin(email, password);
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
  }

  Future<bool> checkAuthenticationStatus() async {
    _isAuthenticated = await _authRepository.isAuthenticated();
    return _isAuthenticated;
  }


}
