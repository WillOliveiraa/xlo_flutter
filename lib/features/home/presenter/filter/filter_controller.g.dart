// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FilterController on _FilterControllerBase, Store {
  Computed<String?>? _$priceErrorComputed;

  @override
  String? get priceError =>
      (_$priceErrorComputed ??= Computed<String?>(() => super.priceError,
              name: '_FilterControllerBase.priceError'))
          .value;
  Computed<bool>? _$isTypeParticularComputed;

  @override
  bool get isTypeParticular => (_$isTypeParticularComputed ??= Computed<bool>(
          () => super.isTypeParticular,
          name: '_FilterControllerBase.isTypeParticular'))
      .value;
  Computed<bool>? _$isTypeProfessionalComputed;

  @override
  bool get isTypeProfessional => (_$isTypeProfessionalComputed ??=
          Computed<bool>(() => super.isTypeProfessional,
              name: '_FilterControllerBase.isTypeProfessional'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_FilterControllerBase.isFormValid'))
          .value;

  final _$_orderByAtom = Atom(name: '_FilterControllerBase._orderBy');

  @override
  OrderBy get _orderBy {
    _$_orderByAtom.reportRead();
    return super._orderBy;
  }

  @override
  set _orderBy(OrderBy value) {
    _$_orderByAtom.reportWrite(value, super._orderBy, () {
      super._orderBy = value;
    });
  }

  final _$_minPriceAtom = Atom(name: '_FilterControllerBase._minPrice');

  @override
  int? get _minPrice {
    _$_minPriceAtom.reportRead();
    return super._minPrice;
  }

  @override
  set _minPrice(int? value) {
    _$_minPriceAtom.reportWrite(value, super._minPrice, () {
      super._minPrice = value;
    });
  }

  final _$_maxPriceAtom = Atom(name: '_FilterControllerBase._maxPrice');

  @override
  int? get _maxPrice {
    _$_maxPriceAtom.reportRead();
    return super._maxPrice;
  }

  @override
  set _maxPrice(int? value) {
    _$_maxPriceAtom.reportWrite(value, super._maxPrice, () {
      super._maxPrice = value;
    });
  }

  final _$_vendorTypeAtom = Atom(name: '_FilterControllerBase._vendorType');

  @override
  int get _vendorType {
    _$_vendorTypeAtom.reportRead();
    return super._vendorType;
  }

  @override
  set _vendorType(int value) {
    _$_vendorTypeAtom.reportWrite(value, super._vendorType, () {
      super._vendorType = value;
    });
  }

  final _$_FilterControllerBaseActionController =
      ActionController(name: '_FilterControllerBase');

  @override
  void setOrderBy(OrderBy value) {
    final _$actionInfo = _$_FilterControllerBaseActionController.startAction(
        name: '_FilterControllerBase.setOrderBy');
    try {
      return super.setOrderBy(value);
    } finally {
      _$_FilterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMinPrice(String value) {
    final _$actionInfo = _$_FilterControllerBaseActionController.startAction(
        name: '_FilterControllerBase.setMinPrice');
    try {
      return super.setMinPrice(value);
    } finally {
      _$_FilterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMaxPrice(String value) {
    final _$actionInfo = _$_FilterControllerBaseActionController.startAction(
        name: '_FilterControllerBase.setMaxPrice');
    try {
      return super.setMaxPrice(value);
    } finally {
      _$_FilterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectVendorType(int value) {
    final _$actionInfo = _$_FilterControllerBaseActionController.startAction(
        name: '_FilterControllerBase.selectVendorType');
    try {
      return super.selectVendorType(value);
    } finally {
      _$_FilterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVendorType(int type) {
    final _$actionInfo = _$_FilterControllerBaseActionController.startAction(
        name: '_FilterControllerBase.setVendorType');
    try {
      return super.setVendorType(type);
    } finally {
      _$_FilterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetVendorType(int type) {
    final _$actionInfo = _$_FilterControllerBaseActionController.startAction(
        name: '_FilterControllerBase.resetVendorType');
    try {
      return super.resetVendorType(type);
    } finally {
      _$_FilterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initializeFields(AdFilterEntity filter) {
    final _$actionInfo = _$_FilterControllerBaseActionController.startAction(
        name: '_FilterControllerBase.initializeFields');
    try {
      return super.initializeFields(filter);
    } finally {
      _$_FilterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
priceError: ${priceError},
isTypeParticular: ${isTypeParticular},
isTypeProfessional: ${isTypeProfessional},
isFormValid: ${isFormValid}
    ''';
  }
}
