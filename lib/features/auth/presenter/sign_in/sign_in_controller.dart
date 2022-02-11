import 'package:flutter/material.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:xlo_flutter/core/controllers/auth_controller.dart';
import 'package:xlo_flutter/features/auth/data/models/user_model.dart';
import 'package:xlo_flutter/features/auth/domain/usecases/sign_in_with_email_usecase.dart';

class SignInController extends ChangeNotifier {
  final SignInWithEmailUseCaseImp _signInWithEmailUseCase;
  final AuthController _authController;

  SignInController(this._signInWithEmailUseCase, this._authController);

  String? _email;
  String? _password;

  bool _loading = false;

  bool get loading => _loading;

  UserModel get userModel => UserModel.signInWithEmail(
      email: _email ?? '', password: _password ?? '', name: '');

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  String? get emailError {
    if (_email == null || userModel.isValidEmail) {
      return null;
    } else if (_email!.isEmpty) {
      return 'Campo obrigatório';
    }
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  String? get passwordError {
    if (_password == null || userModel.isValidPassword) {
      return null;
    } else if (_password!.isEmpty) {
      return 'Campo obrigatório';
    }
  }

  bool get isValid => userModel.isValidEmail && userModel.isValidPassword;

  Function? get loginPressed => isValid && !loading ? _login : null;

  Future<void> _login() async {
    loading = true;
    final response =
        await _signInWithEmailUseCase(userModel.email, userModel.password!);

    response.fold((failure) {
      asuka.showSnackBar(SnackBar(content: Text(failure.message!)));
      loading = false;
    }, (user) {
      _authController.setUser(user as UserModel);
      loading = false;
    });
    // await Future.delayed(Duration(seconds: 2));
    // Navigator.of(_context).pop();
    // loading = false;
  }
}
