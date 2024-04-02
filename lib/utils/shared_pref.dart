import 'dart:convert';

import 'package:chat_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
  Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    final userMap = user.toMap();
    await prefs.setString('user', jsonEncode(userMap));
  }

  Future<UserModel?> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userData = prefs.getString('user');
    if (userData != null) {
      final userMap = jsonDecode(userData) as Map<String, dynamic>;
      return UserModel.fromMap(userMap);
    } else {
      return null;
    }
  }
}