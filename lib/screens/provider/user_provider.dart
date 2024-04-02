import 'package:chat_app/models/user_model.dart';
import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  UserModel?get user => _user;
  void updateser(UserModel? newUser) {
    _user = newUser;
    notifyListeners();
  }
}
