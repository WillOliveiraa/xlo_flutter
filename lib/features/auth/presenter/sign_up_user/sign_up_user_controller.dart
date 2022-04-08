import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:xlo_flutter/core/pages/auth/auth_controller.dart';
import 'package:xlo_flutter/features/auth/data/models/sign_up_user_model.dart';
import 'package:xlo_flutter/features/auth/data/models/user_model.dart';
import 'package:xlo_flutter/features/auth/domain/entities/user_entity.dart';
import 'package:xlo_flutter/features/auth/domain/usecases/save_user_usecase.dart';
import 'package:xlo_flutter/features/auth/domain/usecases/sign_up_user_usecase.dart';

part 'sign_up_user_controller.g.dart';

class SignUpUserController = _SignUpUserControllerBase
    with _$SignUpUserController;

abstract class _SignUpUserControllerBase with Store {
  final SignUpUserUseCaseImp _signUpUserUseCase;
  final SaveUserUseCaseImp _saveUserUseCase;
  final authController = Modular.get<AuthController>();

  _SignUpUserControllerBase(this._signUpUserUseCase, this._saveUserUseCase);

  @observable
  UserType? _userType;

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

  String? _userId;

  DateTime? _createAt;

  // ignore: unnecessary_getters_setters
  bool get loading => _loading;

  UserType get userType => _userType!;

  @observable
  dynamic _image;

  @action
  void setUserType(int? value) => _userType = UserType.values[value!];

  // ignore: unnecessary_getters_setters
  dynamic get image => _image;

  @action
  setImage(dynamic value) => _image = value;

  @computed
  SignUpUserModel get userModel => SignUpUserModel.signUpUser(
        name: _name ?? '',
        email: _email ?? '',
        password: _password ?? '',
        passwordConf: _passwordConf ?? '',
        phone: _phone ?? '',
        type: _userType ?? UserType.PARTICULAR,
        image: image,
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
    if (_password == null || userModel.isValidPassword || _userId != null) {
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
  bool get isValid {
    if (_password != null && _password!.isNotEmpty || _userId == null)
      return userModel.isValidName &&
          userModel.isValidEmail &&
          userModel.isValidPhone &&
          userModel.isValidPassword &&
          userModel.isValidPasswordsAreTheSame;

    return userModel.isValidName &&
        userModel.isValidEmail &&
        userModel.isValidPhone;
  }

  @computed
  Function? get signUpPressed => isValid && !loading ? _signUpUser : null;

  @computed
  Function? get savePressed => isValid && !loading ? _saveUser : null;

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

  Future<void> _saveUser() async {
    loading = true;
    final response = await _saveUserUseCase(userModel);

    response.fold((failure) {
      asuka.showSnackBar(SnackBar(content: Text(failure.message!)));
      loading = false;
    }, (_) {
      asuka.showSnackBar(
          SnackBar(content: Text('Usuário alterado com sucesso!')));
      loading = false;
      Modular.to.pop();
      authController.setUser(UserModel(
        name: _name!,
        email: _email!,
        id: _userId,
        phone: _phone,
        createdAt: _createAt,
        type: _userType!,
        image: _image,
      ));
    });
  }

  @action
  void initializeFields(UserModel user) {
    _userId = user.id;
    _createAt = user.createdAt!;
    setUserType(user.type.index);
    setName(user.name);
    setEmail(user.email);
    if (user.phone != null) setPhone(user.phone!);
    if (user.image != null) setImage(user.image);
  }
}
