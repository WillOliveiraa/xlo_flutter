import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_my_ads_usecase/get_my_ads_usecase.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/update_ad_status_usecase/update_ad_status_usecase.dart';

part 'my_ads_controller.g.dart';

class MyAdsController = _MyAdsControllerBase with _$MyAdsController;

abstract class _MyAdsControllerBase with Store {
  _MyAdsControllerBase(this._getMyAdsUseCase, this._adStatusUseCase);

  final GetMyAdsUseCaseImp _getMyAdsUseCase;
  final UpdateAdStatusUseCaseImp _adStatusUseCase;

  @observable
  List<AdModel> myAds = [];

  @computed
  List<AdModel> get activeAds =>
      myAds.where((ad) => ad.status == AdStatus.active).toList();
  List<AdModel> get pendingAds =>
      myAds.where((ad) => ad.status == AdStatus.pending).toList();
  List<AdModel> get soldAds =>
      myAds.where((ad) => ad.status == AdStatus.sold).toList();

  @action
  Future<void> getMyAds() async {
    loading = true;
    final response = await _getMyAdsUseCase();

    response.fold((failure) {
      asuka.showSnackBar(SnackBar(content: Text(failure.message!)));
      loading = false;
    }, (result) {
      myAds = result as List<AdModel>;
      loading = false;
    });
  }

  @observable
  bool loading = true;

  Future<void> refresh() => getMyAds();

  Future<void> soldAd(AdModel ad) async {
    updateStatus(ad.id!, AdStatus.sold);
  }

  Future<void> deleteAd(AdModel ad) async {
    updateStatus(ad.id!, AdStatus.deleted);
  }

  @action
  Future<void> updateStatus(String adId, AdStatus status) async {
    loading = true;
    final response = await _adStatusUseCase(adId: adId, adStatus: status);

    response.fold((failure) {
      asuka.showSnackBar(SnackBar(content: Text(failure.message!)));
      loading = false;
    }, (_) {
      loading = false;
      refresh();
    });
  }
}
