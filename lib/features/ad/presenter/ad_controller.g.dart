// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AdController on _AdControllerBase, Store {
  Computed<AdModel>? _$adModelComputed;

  @override
  AdModel get adModel =>
      (_$adModelComputed ??= Computed<AdModel>(() => super.adModel,
              name: '_AdControllerBase.adModel'))
          .value;
  Computed<String?>? _$titleErrorComputed;

  @override
  String? get titleError =>
      (_$titleErrorComputed ??= Computed<String?>(() => super.titleError,
              name: '_AdControllerBase.titleError'))
          .value;
  Computed<String?>? _$descriptionErrorComputed;

  @override
  String? get descriptionError => (_$descriptionErrorComputed ??=
          Computed<String?>(() => super.descriptionError,
              name: '_AdControllerBase.descriptionError'))
      .value;
  Computed<String?>? _$priceErrorComputed;

  @override
  String? get priceError =>
      (_$priceErrorComputed ??= Computed<String?>(() => super.priceError,
              name: '_AdControllerBase.priceError'))
          .value;
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_AdControllerBase.isValid'))
      .value;
  Computed<Function?>? _$saveAdPressedComputed;

  @override
  Function? get saveAdPressed => (_$saveAdPressedComputed ??=
          Computed<Function?>(() => super.saveAdPressed,
              name: '_AdControllerBase.saveAdPressed'))
      .value;

  final _$_titleAtom = Atom(name: '_AdControllerBase._title');

  @override
  String? get _title {
    _$_titleAtom.reportRead();
    return super._title;
  }

  @override
  set _title(String? value) {
    _$_titleAtom.reportWrite(value, super._title, () {
      super._title = value;
    });
  }

  final _$_descriptionAtom = Atom(name: '_AdControllerBase._description');

  @override
  String? get _description {
    _$_descriptionAtom.reportRead();
    return super._description;
  }

  @override
  set _description(String? value) {
    _$_descriptionAtom.reportWrite(value, super._description, () {
      super._description = value;
    });
  }

  final _$_priceAtom = Atom(name: '_AdControllerBase._price');

  @override
  num? get _price {
    _$_priceAtom.reportRead();
    return super._price;
  }

  @override
  set _price(num? value) {
    _$_priceAtom.reportWrite(value, super._price, () {
      super._price = value;
    });
  }

  final _$_imagesAtom = Atom(name: '_AdControllerBase._images');

  @override
  List<dynamic> get _images {
    _$_imagesAtom.reportRead();
    return super._images;
  }

  @override
  set _images(List<dynamic> value) {
    _$_imagesAtom.reportWrite(value, super._images, () {
      super._images = value;
    });
  }

  final _$_loadingAtom = Atom(name: '_AdControllerBase._loading');

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

  final _$_AdControllerBaseActionController =
      ActionController(name: '_AdControllerBase');

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_AdControllerBaseActionController.startAction(
        name: '_AdControllerBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_AdControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_AdControllerBaseActionController.startAction(
        name: '_AdControllerBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_AdControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(String value) {
    final _$actionInfo = _$_AdControllerBaseActionController.startAction(
        name: '_AdControllerBase.setPrice');
    try {
      return super.setPrice(value);
    } finally {
      _$_AdControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
adModel: ${adModel},
titleError: ${titleError},
descriptionError: ${descriptionError},
priceError: ${priceError},
isValid: ${isValid},
saveAdPressed: ${saveAdPressed}
    ''';
  }
}
