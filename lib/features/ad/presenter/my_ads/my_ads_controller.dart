import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_my_ads_usecase/get_my_ads_usecase.dart';

part 'my_ads_controller.g.dart';

class MyAdsController = _MyAdsControllerBase with _$MyAdsController;

abstract class _MyAdsControllerBase with Store {
  final GetMyAdsUseCaseImp _getMyAdsUseCase;

  _MyAdsControllerBase(this._getMyAdsUseCase);

  @observable
  List<AdModel> myAds = [];

  @computed
  List<AdModel> get activeAds =>
      myAds.where((ad) => ad.status == AdStatus.ACTIVE).toList();
  List<AdModel> get pendingAds =>
      myAds.where((ad) => ad.status == AdStatus.PENDING).toList();
  List<AdModel> get soldAds =>
      myAds.where((ad) => ad.status == AdStatus.SOLD).toList();

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

  void refresh() => getMyAds();

  @action
  Future<void> soldAd(AdModel ad) async {
    loading = true;
    // await AdRepository().sold(ad);
    refresh();
  }

  @action
  Future<void> deleteAd(AdModel ad) async {
    loading = true;
    // await AdRepository().delete(ad);
    refresh();
  }
}
