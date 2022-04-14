import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:xlo_flutter/core/pages/auth/auth_controller.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_my_favorite_ads_usecase/get_my_favorite_ads_usecase.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/remove_favorite_ad_usecase/remove_favorite_ad_usecase.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/save_favorite_ad_usecase/save_favorite_ad_usecase.dart';

part 'my_favorite_ads_controller.g.dart';

class MyFavoriteAdsController = _MyFavoriteAdsControllerBase
    with _$MyFavoriteAdsController;

abstract class _MyFavoriteAdsControllerBase with Store {
  final GetMyFavoriteAdsUseCaseImp _getMyFavoriteAdsUseCase;
  final AuthController _authController;
  final SaveFavoriteAdUseCase _saveFavoriteAdUseCase;
  final RemoveFavoriteAdUseCase _removeFavoriteAdUseCase;

  _MyFavoriteAdsControllerBase(
    this._getMyFavoriteAdsUseCase,
    this._authController,
    this._saveFavoriteAdUseCase,
    this._removeFavoriteAdUseCase,
  );

  ObservableList<AdModel> myFavoriteAds = ObservableList<AdModel>();

  @observable
  bool loading = true;

  @action
  Future<void> getMyFavoriteAds() async {
    loading = true;
    final response = await _getMyFavoriteAdsUseCase(_authController.user!.id!);

    response.fold((failure) {
      asuka.showSnackBar(SnackBar(content: Text(failure.message!)));
      loading = false;
    }, (result) {
      myFavoriteAds.clear();
      myFavoriteAds.addAll(result as List<AdModel>);
      loading = false;
    });
  }

  Future<void> refresh() => getMyFavoriteAds();

  bool checkIsFavorite(String adId) {
    return myFavoriteAds.any((el) => el.id == adId);
  }

  @action
  Future<void> toggleFavorite(AdModel ad) async {
    if (myFavoriteAds.any((el) => el.id == ad.id)) {
      final response = await _removeFavoriteAdUseCase(
          adId: ad.id!, userId: _authController.user!.id!);

      response.fold((failure) {
        asuka.showSnackBar(SnackBar(content: Text(failure.message!)));
      }, (_) {
        myFavoriteAds.removeWhere((el) => el.id == ad.id);

        asuka.showSnackBar(
            SnackBar(content: Text('Favorito removido com sucesso!')));
      });
    } else {
      final response = await _saveFavoriteAdUseCase(
          adId: ad.id!, userId: _authController.user!.id!);

      response.fold((failure) {
        asuka.showSnackBar(SnackBar(content: Text(failure.message!)));
      }, (_) {
        myFavoriteAds.add(ad);

        asuka.showSnackBar(SnackBar(
          content: Text('Favorito adicionado com sucesso!'),
          backgroundColor: Colors.green,
        ));
      });
    }
  }
}
