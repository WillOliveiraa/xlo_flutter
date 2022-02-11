import 'package:flutter/material.dart';
import 'package:xlo_flutter/features/auth/data/models/user_model.dart';

class AuthController extends ChangeNotifier {
  UserModel? _userModel;

  UserModel? get user => _userModel;

  void setUser(UserModel? user) {
    _userModel = user;
    notifyListeners();
  }
}
