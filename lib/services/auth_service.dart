import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import '../models/user.dart';

class AuthService {
  static const String _usersKey = 'users';
  static const String _currentUserKey = 'currentUser';
  final SharedPreferences _prefs;

  AuthService(this._prefs);

  Future<User?> getCurrentUser() async {
    final userJson = _prefs.getString(_currentUserKey);
    if (userJson == null) return null;
    return User.fromJson(json.decode(userJson));
  }

  Future<List<User>> _getUsers() async {
    final usersJson = _prefs.getString(_usersKey);
    if (usersJson == null) return [];
    final List<dynamic> usersList = json.decode(usersJson);
    return usersList.map((e) => User.fromJson(e)).toList();
  }

  Future<void> _saveUsers(List<User> users) async {
    final usersJson = json.encode(users.map((e) => e.toJson()).toList());
    await _prefs.setString(_usersKey, usersJson);
  }

  Future<bool> register(String name, String email, String password) async {
    final users = await _getUsers();
    
    // Check if email already exists
    if (users.any((user) => user.email == email)) {
      return false;
    }

    final newUser = User(
      id: const Uuid().v4(),
      name: name,
      email: email,
      password: password,
    );

    users.add(newUser);
    await _saveUsers(users);
    await _prefs.setString(_currentUserKey, json.encode(newUser.toJson()));
    return true;
  }

  Future<bool> login(String email, String password) async {
    final users = await _getUsers();
    final user = users.firstWhere(
      (user) => user.email == email && user.password == password,
      orElse: () => throw Exception('Invalid credentials'),
    );

    await _prefs.setString(_currentUserKey, json.encode(user.toJson()));
    return true;
  }

  Future<void> logout() async {
    await _prefs.remove(_currentUserKey);
  }

  Future<void> updateUser(User updatedUser) async {
    final users = await _getUsers();
    final index = users.indexWhere((user) => user.id == updatedUser.id);
    if (index != -1) {
      users[index] = updatedUser;
      await _saveUsers(users);
      await _prefs.setString(_currentUserKey, json.encode(updatedUser.toJson()));
    }
  }
}
