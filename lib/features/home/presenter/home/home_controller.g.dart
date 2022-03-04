// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<List<AdModel>>? _$filteredAdsComputed;

  @override
  List<AdModel> get filteredAds => (_$filteredAdsComputed ??=
          Computed<List<AdModel>>(() => super.filteredAds,
              name: '_HomeControllerBase.filteredAds'))
      .value;

  final _$adsAtom = Atom(name: '_HomeControllerBase.ads');

  @override
  List<AdModel> get ads {
    _$adsAtom.reportRead();
    return super.ads;
  }

  @override
  set ads(List<AdModel> value) {
    _$adsAtom.reportWrite(value, super.ads, () {
      super.ads = value;
    });
  }

  final _$categoriesAtom = Atom(name: '_HomeControllerBase.categories');

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

  final _$loadingAtom = Atom(name: '_HomeControllerBase.loading');

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

  final _$searchAtom = Atom(name: '_HomeControllerBase.search');

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

  final _$getAllAdsAsyncAction = AsyncAction('_HomeControllerBase.getAllAds');

  @override
  Future<void> getAllAds() {
    return _$getAllAdsAsyncAction.run(() => super.getAllAds());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void setSeach(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setSeach');
    try {
      return super.setSeach(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
ads: ${ads},
categories: ${categories},
loading: ${loading},
search: ${search},
filteredAds: ${filteredAds}
    ''';
  }
}
