// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cep_field_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CepFieldController on _CepFieldControllerBase, Store {
  Computed<String>? _$clearCepComputed;

  @override
  String get clearCep =>
      (_$clearCepComputed ??= Computed<String>(() => super.clearCep,
              name: '_CepFieldControllerBase.clearCep'))
          .value;
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_CepFieldControllerBase.isValid'))
      .value;

  final _$_cepAtom = Atom(name: '_CepFieldControllerBase._cep');

  @override
  String? get _cep {
    _$_cepAtom.reportRead();
    return super._cep;
  }

  @override
  set _cep(String? value) {
    _$_cepAtom.reportWrite(value, super._cep, () {
      super._cep = value;
    });
  }

  final _$_addressAtom = Atom(name: '_CepFieldControllerBase._address');

  @override
  AddressModel? get _address {
    _$_addressAtom.reportRead();
    return super._address;
  }

  @override
  set _address(AddressModel? value) {
    _$_addressAtom.reportWrite(value, super._address, () {
      super._address = value;
    });
  }

  final _$_errorAtom = Atom(name: '_CepFieldControllerBase._error');

  @override
  String? get _error {
    _$_errorAtom.reportRead();
    return super._error;
  }

  @override
  set _error(String? value) {
    _$_errorAtom.reportWrite(value, super._error, () {
      super._error = value;
    });
  }

  final _$_loadingAtom = Atom(name: '_CepFieldControllerBase._loading');

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

  final _$_searchCepAsyncAction =
      AsyncAction('_CepFieldControllerBase._searchCep');

  @override
  Future<void> _searchCep() {
    return _$_searchCepAsyncAction.run(() => super._searchCep());
  }

  final _$_CepFieldControllerBaseActionController =
      ActionController(name: '_CepFieldControllerBase');

  @override
  void setCep(String value) {
    final _$actionInfo = _$_CepFieldControllerBaseActionController.startAction(
        name: '_CepFieldControllerBase.setCep');
    try {
      return super.setCep(value);
    } finally {
      _$_CepFieldControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _reset() {
    final _$actionInfo = _$_CepFieldControllerBaseActionController.startAction(
        name: '_CepFieldControllerBase._reset');
    try {
      return super._reset();
    } finally {
      _$_CepFieldControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
clearCep: ${clearCep},
isValid: ${isValid}
    ''';
  }
}
