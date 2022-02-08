import 'package:flutter/cupertino.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:xlo_flutter/features/auth/data/models/sign_up_user_model.dart';
import 'package:xlo_flutter/features/auth/domain/usecases/sign_up_user_usecase.dart';

class SignUpUserController extends ChangeNotifier {
  final SignUpUserUseCaseImp _signUpUserUseCase;

  SignUpUserController(this._signUpUserUseCase);

  String? _name;
  String? _email;
  String? _password;
  String? _passwordConf;
  String? _phone;

  bool _loading = false;

  bool get loading => _loading;

  SignUpUserModel get userModel => SignUpUserModel.signUpUser(
        name: _name ?? '',
        email: _email ?? '',
        password: _password ?? '',
        passwordConf: _passwordConf ?? '',
        phone: _phone ?? '',
      );

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void setName(String value) {
    _name = value;
    notifyListeners();
  }

  String? get nameError {
    if (_name == null || userModel.isValidName) {
      return null;
    } else if (_name!.isEmpty) {
      return 'Campo obrigatório';
    }
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
    } else {
      return 'E-mail inválido';
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

  void setPasswordConf(String value) {
    _passwordConf = value;
    notifyListeners();
  }

  String? get passwordErrorConf {
    if (_passwordConf == null || userModel.isValidPasswordsAreTheSame) {
      return null;
    } else {
      return 'Senhas não são iguais';
    }
  }

  void setPhone(String value) {
    _phone = value;
    notifyListeners();
  }

  String? get phoneError {
    if (_phone == null || userModel.isValidPhone) {
      return null;
    } else if (_phone!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Número inválido';
    }
  }

  bool get isValid =>
      userModel.isValidName &&
      userModel.isValidEmail &&
      userModel.isValidPhone &&
      userModel.isValidPassword &&
      userModel.isValidPasswordsAreTheSame;

  Function? get signUpPressed => isValid && !loading ? _signUpUser : null;

  Future<void> _signUpUser() async {
    loading = true;
    final response = await _signUpUserUseCase(userModel);

    response.fold((failure) {
      asuka.showSnackBar(SnackBar(content: Text(failure.message!)));
      loading = false;
    }, (user) {
      asuka
          .showSnackBar(SnackBar(content: Text('Usuário criado com sucesso!')));
      loading = false;
    });
  }
}
