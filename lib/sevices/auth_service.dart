import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  bool _isAuthenticated = false;
  bool _isAuthGuardEnabled = false;

  bool get isAuthenticated => _isAuthenticated;
  bool get isAuthGuardEnabled => _isAuthGuardEnabled;

  void login() {
    _isAuthenticated = true;
    notifyListeners();
  }

  void toggleAuthGuard() {
    _isAuthGuardEnabled = !_isAuthGuardEnabled;
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}

final AuthService globalAuthService = AuthService();