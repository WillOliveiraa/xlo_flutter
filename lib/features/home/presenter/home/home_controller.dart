import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:xlo_flutter/features/ad/data/models/ad_filter_model.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/data/models/category_model.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_all_ad_usecase/get_all_ad_usecase.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_filtered_ads_usecase/get_filtered_ads_usecase.dart';
import 'package:xlo_flutter/features/home/presenter/filter/filter_controller.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GetAllAdsUseCaseImp _getAllAdsUseCase;
  final GetFilteredAdsUseCaseImp _getFilteredAdsUseCase;
  final FilterController _filterController;

  _HomeControllerBase(
    this._getAllAdsUseCase,
    this._getFilteredAdsUseCase,
    this._filterController,
  ) {
    adFilter = AdFilterModel(
      orderBy: _filterController.orderBy,
      minPrice: _filterController.minPrice,
      maxPrice: _filterController.maxPrice,
      vendorType: _filterController.vendorType,
    );
  }

  @observable
  List<AdModel> ads = [];

  @observable
  List<CategoryModel> categories = [];

  @observable
  bool loading = true;

  @observable
  String search = '';

  AdFilterModel? adFilter;

  @observable
  CategoryModel? _category;

  CategoryModel? get category => _category;

  @action
  void setCategory(CategoryModel? value) => _category = value;

  @action
  void setSeach(String value) {
    search = value;
    // resetPage();
  }

  void checkIfNeedToUpdateList() {
    if (ads.isEmpty) getFilteredAds();
    // getAllAds();
  }

  @action
  void setAdFilter(AdFilterModel filter) {
    adFilter = filter;
  }

  // @computed
  // AdFilterModel get adFilter => AdFilterModel(
  //       orderBy: _filterController.orderBy,
  //       minPrice: _filterController.minPrice,
  //       maxPrice: _filterController.maxPrice,
  //       vendorType: _filterController.vendorType,
  //     );

  // @computed
  // AdFilterModel get adFilter => _filterController.clone();

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

  @action
  Future<void> getFilteredAds() async {
    loading = true;
    final response = await _getFilteredAdsUseCase(
        filter: adFilter!, search: search, category: category, page: page);

    response.fold((failure) {
      asuka.showSnackBar(SnackBar(content: Text(failure.message!)));
      loading = false;
    }, (result) {
      ads = result as List<AdModel>;
      loading = false;
    });
  }

  // ignore: slash_for_doc_comments
  /**
   * Pagination
   */

  @observable
  int page = 0;

  @action
  void loadNextPage() {
    page++;
  }

  @computed
  int get itemCount => lastPage ? ads.length : ads.length + 1;

  @observable
  bool lastPage = false;

  @action
  void addNewAds(List<AdModel> newAds) {
    if (newAds.length < 5) lastPage = true;
    ads.addAll(newAds);
  }

  void resetPage() {
    page = 0;
    ads.clear();
    lastPage = false;
  }
}
