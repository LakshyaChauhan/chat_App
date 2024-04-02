import 'package:chat_app/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  UserModel? get user => _user;
  void setUser(UserModel? user) {
    _user = user;
    _saveUserToSharedPreferences(user);
    notifyListeners();
  }

  Future<void> _saveUserToSharedPreferences(UserModel? user) async {
    if (user != null) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('user', user.toJson());
      // Save other user properties as needed (convert to strings if necessary)
    } else {
      // Clear user data from SharedPreferences if user is null
      await _clearUserFromSharedPreferences();
    }
  }

  Future<void> _clearUserFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
    // Remove other user properties from SharedPreferences
  }

  Future<void> getUserFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString('user');
    if (userString != null) {
      _user = UserModel.fromJson(userString);
    }
    notifyListeners();
  }
}
