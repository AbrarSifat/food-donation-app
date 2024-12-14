import 'package:flutter/foundation.dart';
import '../models/user.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService;
  User? _currentUser;

  AuthProvider(this._authService) {
    _loadCurrentUser();
  }

  User? get currentUser => _currentUser;
  bool get isAuthenticated => _currentUser != null;

  Future<void> _loadCurrentUser() async {
    _currentUser = await _authService.getCurrentUser();
    notifyListeners();
  }

  Future<bool> register(String name, String email, String password) async {
    try {
      final success = await _authService.register(name, email, password);
      if (success) {
        await _loadCurrentUser();
      }
      return success;
    } catch (e) {
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      final success = await _authService.login(email, password);
      if (success) {
        await _loadCurrentUser();
      }
      return success;
    } catch (e) {
      return false;
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    _currentUser = null;
    notifyListeners();
  }

  Future<void> updateUser(User updatedUser) async {
    await _authService.updateUser(updatedUser);
    _currentUser = updatedUser;
    notifyListeners();
  }
}
