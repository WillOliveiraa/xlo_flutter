import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:xlo_flutter/features/ad/data/models/ad_filter_model.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/data/models/category_model.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_all_ad_usecase/get_all_ad_usecase.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_all_categories_usecase/get_all_categories_usecase.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_filtered_ads_usecase/get_filtered_ads_usecase.dart';
import 'package:xlo_flutter/features/home/presenter/filter/filter_controller.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GetAllAdsUseCaseImp _getAllAdsUseCase;
  final GetAllCategoriesUseCaseImp _getAllCategoriesUseCase;
  final GetFilteredAdsUseCaseImp _getFilteredAdsUseCase;
  final FilterController _filterController;

  _HomeControllerBase(
    this._getAllAdsUseCase,
    this._getFilteredAdsUseCase,
    this._filterController,
    this._getAllCategoriesUseCase,
  ) {
    adFilter = AdFilterModel(
      orderBy: _filterController.orderBy,
      minPrice: _filterController.minPrice,
      maxPrice: _filterController.maxPrice,
      vendorType: _filterController.vendorType,
    );
  }

  ObservableList<AdModel> ads = ObservableList<AdModel>();

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
  void setCategory(CategoryModel? value) {
    _category = value;
    getFilteredAds(false);
  }

  @action
  void setSeach(String value) {
    search = value;
    // resetPage();
  }

  void checkIfNeedToUpdateList(bool loadMore) {
    if (lastPage) return;

    getFilteredAds(loadMore);
    if (categories.isEmpty) getAllCategories();
    // if (ads.isEmpty) getFilteredAds();
    // getAllAds();
  }

  @action
  void setAdFilter(AdFilterModel filter) {
    adFilter = filter;
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
      ads = result as ObservableList<AdModel>;
      loading = false;
    });
  }

  @action
  Future<void> getAllCategories() async {
    final response = await _getAllCategoriesUseCase();

    response.fold((failure) {
      asuka.showSnackBar(SnackBar(content: Text(failure.message!)));
    }, (result) {
      categories = result as List<CategoryModel>;
      categories.insert(0, CategoryModel(id: '*', description: 'Categoria'));
    });
  }

  Future<void> getFilteredAds(bool loadMore) async {
    if (!loadMore) loading = true;

    final response = await _getFilteredAdsUseCase(
        filter: adFilter!, search: search, category: category, page: page);

    response.fold((failure) {
      asuka.showSnackBar(SnackBar(content: Text(failure.message!)));
      if (!loadMore) loading = false;
    }, (result) {
      addNewAds(result as List<AdModel>);
      if (!loadMore) loading = false;
    });
  }

  Future<void> refreshAds() async {
    resetPage();
    getFilteredAds(false);
  }

  void resetPage() {
    page = 0;
    ads.clear();
    lastPage = false;
  }

  // Pagination
  int page = 0;

  @observable
  bool lastPage = false;

  @computed
  int get itemCount {
    if (search.isNotEmpty) return filteredAds.length;

    return lastPage ? ads.length : ads.length + 1;
  }

  @action
  void addNewAds(List<AdModel> newAds) {
    page++;
    if (newAds.isEmpty)
      lastPage = true;
    else
      ads.addAll(newAds);
  }
}
