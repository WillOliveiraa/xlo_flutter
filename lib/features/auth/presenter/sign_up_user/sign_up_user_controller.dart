import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:xlo_flutter/features/auth/data/models/sign_up_user_model.dart';
import 'package:xlo_flutter/features/auth/domain/usecases/sign_up_user_usecase.dart';

part 'sign_up_user_controller.g.dart';

class SignUpUserController = _SignUpUserControllerBase
    with _$SignUpUserController;

abstract class _SignUpUserControllerBase with Store {
  final SignUpUserUseCaseImp _signUpUserUseCase;

  _SignUpUserControllerBase(this._signUpUserUseCase);

  @observable
  String? _name;
  @observable
  String? _email;
  @observable
  String? _password;
  @observable
  String? _passwordConf;
  @observable
  String? _phone;

  @observable
  bool _loading = false;

  // ignore: unnecessary_getters_setters
  bool get loading => _loading;

  @computed
  SignUpUserModel get userModel => SignUpUserModel.signUpUser(
        name: _name ?? '',
        email: _email ?? '',
        password: _password ?? '',
        passwordConf: _passwordConf ?? '',
        phone: _phone ?? '',
      );

  // @action
  set loading(bool value) => _loading = value;

  @action
  void setName(String value) => _name = value;

  @computed
  String? get nameError {
    if (_name == null || userModel.isValidName) {
      return null;
    } else if (_name!.isEmpty) {
      return 'Campo obrigatório';
    }
  }

  @action
  void setEmail(String value) => _email = value;

  @computed
  String? get emailError {
    if (_email == null || userModel.isValidEmail) {
      return null;
    } else if (_email!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'E-mail inválido';
    }
  }

  @action
  void setPassword(String value) => _password = value;

  @computed
  String? get passwordError {
    if (_password == null || userModel.isValidPassword) {
      return null;
    } else if (_password!.isEmpty) {
      return 'Campo obrigatório';
    }
  }

  @action
  void setPasswordConf(String value) => _passwordConf = value;

  @computed
  String? get passwordErrorConf {
    if (_passwordConf == null || userModel.isValidPasswordsAreTheSame) {
      return null;
    } else {
      return 'Senhas não são iguais';
    }
  }

  @action
  void setPhone(String value) => _phone = value;

  @computed
  String? get phoneError {
    if (_phone == null || userModel.isValidPhone) {
      return null;
    } else if (_phone!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Número inválido';
    }
  }

  @computed
  bool get isValid =>
      userModel.isValidName &&
      userModel.isValidEmail &&
      userModel.isValidPhone &&
      userModel.isValidPassword &&
      userModel.isValidPasswordsAreTheSame;

  @computed
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
