// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<List<AdModel>>? _$filteredAdsComputed;

  @override
  List<AdModel> get filteredAds =>
      (_$filteredAdsComputed ??= Computed<List<AdModel>>(
        () => super.filteredAds,
        name: '_HomeControllerBase.filteredAds',
      ))
          .value;
  Computed<int>? _$itemCountComputed;

  @override
  int get itemCount => (_$itemCountComputed ??= Computed<int>(
        () => super.itemCount,
        name: '_HomeControllerBase.itemCount',
      ))
          .value;

  final Atom _$categoriesAtom = Atom(name: '_HomeControllerBase.categories');

  @override
  List<CategoryModel> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<CategoryModel> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  final Atom _$loadingAtom = Atom(name: '_HomeControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final Atom _$searchAtom = Atom(name: '_HomeControllerBase.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final Atom _$_categoryAtom = Atom(name: '_HomeControllerBase._category');

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

  final Atom _$lastPageAtom = Atom(name: '_HomeControllerBase.lastPage');

  @override
  bool get lastPage {
    _$lastPageAtom.reportRead();
    return super.lastPage;
  }

  @override
  set lastPage(bool value) {
    _$lastPageAtom.reportWrite(value, super.lastPage, () {
      super.lastPage = value;
    });
  }

  final AsyncAction _$getAllAdsAsyncAction =
      AsyncAction('_HomeControllerBase.getAllAds');

  @override
  Future<void> getAllAds() {
    return _$getAllAdsAsyncAction.run(() => super.getAllAds());
  }

  final AsyncAction _$getAllCategoriesAsyncAction =
      AsyncAction('_HomeControllerBase.getAllCategories');

  @override
  Future<void> getAllCategories() {
    return _$getAllCategoriesAsyncAction.run(() => super.getAllCategories());
  }

  final ActionController _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void setCategory(CategoryModel? value) {
    final ActionRunInfo _$actionInfo =
        _$_HomeControllerBaseActionController.startAction(
      name: '_HomeControllerBase.setCategory',
    );
    try {
      return super.setCategory(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSeach(String value) {
    final ActionRunInfo _$actionInfo =
        _$_HomeControllerBaseActionController.startAction(
      name: '_HomeControllerBase.setSeach',
    );
    try {
      return super.setSeach(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAdFilter(AdFilterModel filter) {
    final ActionRunInfo _$actionInfo =
        _$_HomeControllerBaseActionController.startAction(
      name: '_HomeControllerBase.setAdFilter',
    );
    try {
      return super.setAdFilter(filter);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNewAds(List<AdModel> newAds) {
    final ActionRunInfo _$actionInfo =
        _$_HomeControllerBaseActionController.startAction(
      name: '_HomeControllerBase.addNewAds',
    );
    try {
      return super.addNewAds(newAds);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categories: ${categories},
loading: ${loading},
search: ${search},
lastPage: ${lastPage},
filteredAds: ${filteredAds},
itemCount: ${itemCount}
    ''';
  }
}
