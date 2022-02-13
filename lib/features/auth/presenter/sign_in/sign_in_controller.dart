import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:xlo_flutter/core/pages/auth/auth_controller.dart';
import 'package:xlo_flutter/core/shared/router/routers.dart';
import 'package:xlo_flutter/features/auth/data/models/user_model.dart';
import 'package:xlo_flutter/features/auth/domain/usecases/sign_in_with_email_usecase.dart';

part 'sign_in_controller.g.dart';

class SignInController = _SignInControllerBase with _$SignInController;

abstract class _SignInControllerBase with Store {
  final SignInWithEmailUseCaseImp _signInWithEmailUseCase;
  final AuthController _authController;

  _SignInControllerBase(this._signInWithEmailUseCase, this._authController);

  @observable
  String? _email;
  @observable
  String? _password;

  @observable
  bool _loading = false;

  // ignore: unnecessary_getters_setters
  bool get loading => _loading;

  @computed
  UserModel get userModel => UserModel.signInWithEmail(
      email: _email ?? '', password: _password ?? '', name: '');

  // @action
  set loading(bool value) => _loading = value;

  @action
  void setEmail(String value) => _email = value;

  @computed
  String? get emailError {
    if (_email == null || userModel.isValidEmail) {
      return null;
    } else if (_email!.isEmpty) {
      return 'Campo obrigatório';
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

  @computed
  bool get isValid => userModel.isValidEmail && userModel.isValidPassword;

  @computed
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
      Modular.to.popUntil(ModalRoute.withName(homeRouter));
    });
  }
}
