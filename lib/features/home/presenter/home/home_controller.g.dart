// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
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

  final _$getAllAdsAsyncAction = AsyncAction('_HomeControllerBase.getAllAds');

  @override
  Future<void> getAllAds() {
    return _$getAllAdsAsyncAction.run(() => super.getAllAds());
  }

  @override
  String toString() {
    return '''
ads: ${ads}
    ''';
  }
}
