// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SaveUserController on _SaveUserControllerBase, Store {
  final _$_userTypeAtom = Atom(name: '_SaveUserControllerBase._userType');

  @override
  UserType? get _userType {
    _$_userTypeAtom.reportRead();
    return super._userType;
  }

  @override
  set _userType(UserType? value) {
    _$_userTypeAtom.reportWrite(value, super._userType, () {
      super._userType = value;
    });
  }

  final _$nameAtom = Atom(name: '_SaveUserControllerBase.name');

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$_SaveUserControllerBaseActionController =
      ActionController(name: '_SaveUserControllerBase');

  @override
  void setUserType(int value) {
    final _$actionInfo = _$_SaveUserControllerBaseActionController.startAction(
        name: '_SaveUserControllerBase.setUserType');
    try {
      return super.setUserType(value);
    } finally {
      _$_SaveUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_SaveUserControllerBaseActionController.startAction(
        name: '_SaveUserControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_SaveUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name}
    ''';
  }
}
