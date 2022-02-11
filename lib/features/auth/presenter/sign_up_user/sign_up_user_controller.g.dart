// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpUserController on _SignUpUserControllerBase, Store {
  Computed<SignUpUserModel>? _$userModelComputed;

  @override
  SignUpUserModel get userModel =>
      (_$userModelComputed ??= Computed<SignUpUserModel>(() => super.userModel,
              name: '_SignUpUserControllerBase.userModel'))
          .value;
  Computed<String?>? _$nameErrorComputed;

  @override
  String? get nameError =>
      (_$nameErrorComputed ??= Computed<String?>(() => super.nameError,
              name: '_SignUpUserControllerBase.nameError'))
          .value;
  Computed<String?>? _$emailErrorComputed;

  @override
  String? get emailError =>
      (_$emailErrorComputed ??= Computed<String?>(() => super.emailError,
              name: '_SignUpUserControllerBase.emailError'))
          .value;
  Computed<String?>? _$passwordErrorComputed;

  @override
  String? get passwordError =>
      (_$passwordErrorComputed ??= Computed<String?>(() => super.passwordError,
              name: '_SignUpUserControllerBase.passwordError'))
          .value;
  Computed<String?>? _$passwordErrorConfComputed;

  @override
  String? get passwordErrorConf => (_$passwordErrorConfComputed ??=
          Computed<String?>(() => super.passwordErrorConf,
              name: '_SignUpUserControllerBase.passwordErrorConf'))
      .value;
  Computed<String?>? _$phoneErrorComputed;

  @override
  String? get phoneError =>
      (_$phoneErrorComputed ??= Computed<String?>(() => super.phoneError,
              name: '_SignUpUserControllerBase.phoneError'))
          .value;
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_SignUpUserControllerBase.isValid'))
      .value;
  Computed<Function?>? _$signUpPressedComputed;

  @override
  Function? get signUpPressed => (_$signUpPressedComputed ??=
          Computed<Function?>(() => super.signUpPressed,
              name: '_SignUpUserControllerBase.signUpPressed'))
      .value;

  final _$_nameAtom = Atom(name: '_SignUpUserControllerBase._name');

  @override
  String? get _name {
    _$_nameAtom.reportRead();
    return super._name;
  }

  @override
  set _name(String? value) {
    _$_nameAtom.reportWrite(value, super._name, () {
      super._name = value;
    });
  }

  final _$_emailAtom = Atom(name: '_SignUpUserControllerBase._email');

  @override
  String? get _email {
    _$_emailAtom.reportRead();
    return super._email;
  }

  @override
  set _email(String? value) {
    _$_emailAtom.reportWrite(value, super._email, () {
      super._email = value;
    });
  }

  final _$_passwordAtom = Atom(name: '_SignUpUserControllerBase._password');

  @override
  String? get _password {
    _$_passwordAtom.reportRead();
    return super._password;
  }

  @override
  set _password(String? value) {
    _$_passwordAtom.reportWrite(value, super._password, () {
      super._password = value;
    });
  }

  final _$_passwordConfAtom =
      Atom(name: '_SignUpUserControllerBase._passwordConf');

  @override
  String? get _passwordConf {
    _$_passwordConfAtom.reportRead();
    return super._passwordConf;
  }

  @override
  set _passwordConf(String? value) {
    _$_passwordConfAtom.reportWrite(value, super._passwordConf, () {
      super._passwordConf = value;
    });
  }

  final _$_phoneAtom = Atom(name: '_SignUpUserControllerBase._phone');

  @override
  String? get _phone {
    _$_phoneAtom.reportRead();
    return super._phone;
  }

  @override
  set _phone(String? value) {
    _$_phoneAtom.reportWrite(value, super._phone, () {
      super._phone = value;
    });
  }

  final _$_loadingAtom = Atom(name: '_SignUpUserControllerBase._loading');

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  final _$_SignUpUserControllerBaseActionController =
      ActionController(name: '_SignUpUserControllerBase');

  @override
  void setName(String value) {
    final _$actionInfo = _$_SignUpUserControllerBaseActionController
        .startAction(name: '_SignUpUserControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_SignUpUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignUpUserControllerBaseActionController
        .startAction(name: '_SignUpUserControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignUpUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_SignUpUserControllerBaseActionController
        .startAction(name: '_SignUpUserControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_SignUpUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPasswordConf(String value) {
    final _$actionInfo = _$_SignUpUserControllerBaseActionController
        .startAction(name: '_SignUpUserControllerBase.setPasswordConf');
    try {
      return super.setPasswordConf(value);
    } finally {
      _$_SignUpUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_SignUpUserControllerBaseActionController
        .startAction(name: '_SignUpUserControllerBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_SignUpUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userModel: ${userModel},
nameError: ${nameError},
emailError: ${emailError},
passwordError: ${passwordError},
passwordErrorConf: ${passwordErrorConf},
phoneError: ${phoneError},
isValid: ${isValid},
signUpPressed: ${signUpPressed}
    ''';
  }
}
