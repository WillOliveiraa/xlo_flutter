import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/data/models/category_model.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_all_ad_usecase/get_all_ad_usecase.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GetAllAdsUseCaseImp _getAllAdsUseCase;

  _HomeControllerBase(this._getAllAdsUseCase);

  @observable
  List<AdModel> ads = [];

  @observable
  List<CategoryModel> categories = [];

  @observable
  bool loading = false;

  void checkIfNeedToUpdateList() {
    if (ads.isEmpty) getAllAds();
  }

  @action
  Future<void> getAllAds() async {
    loading = true;
    final response = await _getAllAdsUseCase();

    response.fold((failure) {
      asuka.showSnackBar(SnackBar(content: Text(failure.message!)));
      loading = false;
    }, (result) {
      ads = result as List<AdModel>;
      loading = false;
    });
  }
}
