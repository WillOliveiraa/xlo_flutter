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

  @observable
  String search = '';

  @action
  void setSeach(String value) {
    search = value;
    // resetPage();
  }

  void resetPage() {
    ads.clear();
  }

  void checkIfNeedToUpdateList() {
    if (ads.isEmpty) getAllAds();
  }

  @computed
  List<AdModel> get filteredAds {
    final List<AdModel> filteredAds = [];

    if (search.isEmpty) {
      filteredAds.addAll(ads);
    } else {
      filteredAds.addAll(ads.where(
          (ad) => ad.title.toLowerCase().contains(search.toLowerCase())));
    }

    return filteredAds;
  }

  AdModel? findAdById(String id) {
    try {
      return ads.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
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
