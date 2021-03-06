// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_ad_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SaveAdController on _SaveAdControllerBase, Store {
  Computed<AdModel>? _$adModelComputed;

  @override
  AdModel get adModel =>
      (_$adModelComputed ??= Computed<AdModel>(() => super.adModel,
              name: '_SaveAdControllerBase.adModel'))
          .value;
  Computed<String?>? _$titleErrorComputed;

  @override
  String? get titleError =>
      (_$titleErrorComputed ??= Computed<String?>(() => super.titleError,
              name: '_SaveAdControllerBase.titleError'))
          .value;
  Computed<String?>? _$descriptionErrorComputed;

  @override
  String? get descriptionError => (_$descriptionErrorComputed ??=
          Computed<String?>(() => super.descriptionError,
              name: '_SaveAdControllerBase.descriptionError'))
      .value;
  Computed<String?>? _$priceErrorComputed;

  @override
  String? get priceError =>
      (_$priceErrorComputed ??= Computed<String?>(() => super.priceError,
              name: '_SaveAdControllerBase.priceError'))
          .value;
  Computed<String?>? _$categoryErrorComputed;

  @override
  String? get categoryError =>
      (_$categoryErrorComputed ??= Computed<String?>(() => super.categoryError,
              name: '_SaveAdControllerBase.categoryError'))
          .value;
  Computed<String?>? _$imagesErrorComputed;

  @override
  String? get imagesError =>
      (_$imagesErrorComputed ??= Computed<String?>(() => super.imagesError,
              name: '_SaveAdControllerBase.imagesError'))
          .value;
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_SaveAdControllerBase.isValid'))
      .value;
  Computed<Function?>? _$saveAdPressedComputed;

  @override
  Function? get saveAdPressed => (_$saveAdPressedComputed ??=
          Computed<Function?>(() => super.saveAdPressed,
              name: '_SaveAdControllerBase.saveAdPressed'))
      .value;

  final _$_titleAtom = Atom(name: '_SaveAdControllerBase._title');

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

  final _$_descriptionAtom = Atom(name: '_SaveAdControllerBase._description');

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

  final _$_priceAtom = Atom(name: '_SaveAdControllerBase._price');

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

  final _$_loadingAtom = Atom(name: '_SaveAdControllerBase._loading');

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

  final _$_loadingCategoriesAtom =
      Atom(name: '_SaveAdControllerBase._loadingCategories');

  @override
  bool get _loadingCategories {
    _$_loadingCategoriesAtom.reportRead();
    return super._loadingCategories;
  }

  @override
  set _loadingCategories(bool value) {
    _$_loadingCategoriesAtom.reportWrite(value, super._loadingCategories, () {
      super._loadingCategories = value;
    });
  }

  final _$_categoriesAtom = Atom(name: '_SaveAdControllerBase._categories');

  @override
  List<CategoryModel> get _categories {
    _$_categoriesAtom.reportRead();
    return super._categories;
  }

  @override
  set _categories(List<CategoryModel> value) {
    _$_categoriesAtom.reportWrite(value, super._categories, () {
      super._categories = value;
    });
  }

  final _$_categoryAtom = Atom(name: '_SaveAdControllerBase._category');

  @override
  CategoryModel? get _category {
    _$_categoryAtom.reportRead();
    return super._category;
  }

  @override
  set _category(CategoryModel? value) {
    _$_categoryAtom.reportWrite(value, super._category, () {
      super._category = value;
    });
  }

  final _$_hidePhoneAtom = Atom(name: '_SaveAdControllerBase._hidePhone');

  @override
  bool? get _hidePhone {
    _$_hidePhoneAtom.reportRead();
    return super._hidePhone;
  }

  @override
  set _hidePhone(bool? value) {
    _$_hidePhoneAtom.reportWrite(value, super._hidePhone, () {
      super._hidePhone = value;
    });
  }

  final _$isUpdateAdAtom = Atom(name: '_SaveAdControllerBase.isUpdateAd');

  @override
  bool get isUpdateAd {
    _$isUpdateAdAtom.reportRead();
    return super.isUpdateAd;
  }

  @override
  set isUpdateAd(bool value) {
    _$isUpdateAdAtom.reportWrite(value, super.isUpdateAd, () {
      super.isUpdateAd = value;
    });
  }

  final _$getAllCategoriesAsyncAction =
      AsyncAction('_SaveAdControllerBase.getAllCategories');

  @override
  Future<void> getAllCategories() {
    return _$getAllCategoriesAsyncAction.run(() => super.getAllCategories());
  }

  final _$_SaveAdControllerBaseActionController =
      ActionController(name: '_SaveAdControllerBase');

  @override
  void setCategory(CategoryModel? value) {
    final _$actionInfo = _$_SaveAdControllerBaseActionController.startAction(
        name: '_SaveAdControllerBase.setCategory');
    try {
      return super.setCategory(value);
    } finally {
      _$_SaveAdControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHidePhone(bool? value) {
    final _$actionInfo = _$_SaveAdControllerBaseActionController.startAction(
        name: '_SaveAdControllerBase.setHidePhone');
    try {
      return super.setHidePhone(value);
    } finally {
      _$_SaveAdControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_SaveAdControllerBaseActionController.startAction(
        name: '_SaveAdControllerBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_SaveAdControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_SaveAdControllerBaseActionController.startAction(
        name: '_SaveAdControllerBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_SaveAdControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(String value) {
    final _$actionInfo = _$_SaveAdControllerBaseActionController.startAction(
        name: '_SaveAdControllerBase.setPrice');
    try {
      return super.setPrice(value);
    } finally {
      _$_SaveAdControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isUpdateAd: ${isUpdateAd},
adModel: ${adModel},
titleError: ${titleError},
descriptionError: ${descriptionError},
priceError: ${priceError},
categoryError: ${categoryError},
imagesError: ${imagesError},
isValid: ${isValid},
saveAdPressed: ${saveAdPressed}
    ''';
  }
}
