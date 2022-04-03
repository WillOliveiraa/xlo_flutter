// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_ads_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyAdsController on _MyAdsControllerBase, Store {
  Computed<List<AdModel>>? _$activeAdsComputed;

  @override
  List<AdModel> get activeAds =>
      (_$activeAdsComputed ??= Computed<List<AdModel>>(() => super.activeAds,
              name: '_MyAdsControllerBase.activeAds'))
          .value;

  final _$myAdsAtom = Atom(name: '_MyAdsControllerBase.myAds');

  @override
  List<AdModel> get myAds {
    _$myAdsAtom.reportRead();
    return super.myAds;
  }

  @override
  set myAds(List<AdModel> value) {
    _$myAdsAtom.reportWrite(value, super.myAds, () {
      super.myAds = value;
    });
  }

  final _$loadingAtom = Atom(name: '_MyAdsControllerBase.loading');

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

  final _$getMyAdsAsyncAction = AsyncAction('_MyAdsControllerBase.getMyAds');

  @override
  Future<void> getMyAds() {
    return _$getMyAdsAsyncAction.run(() => super.getMyAds());
  }

  final _$soldAdAsyncAction = AsyncAction('_MyAdsControllerBase.soldAd');

  @override
  Future<void> soldAd(AdModel ad) {
    return _$soldAdAsyncAction.run(() => super.soldAd(ad));
  }

  final _$deleteAdAsyncAction = AsyncAction('_MyAdsControllerBase.deleteAd');

  @override
  Future<void> deleteAd(AdModel ad) {
    return _$deleteAdAsyncAction.run(() => super.deleteAd(ad));
  }

  @override
  String toString() {
    return '''
myAds: ${myAds},
loading: ${loading},
activeAds: ${activeAds}
    ''';
  }
}
