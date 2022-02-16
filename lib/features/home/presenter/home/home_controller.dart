import 'package:mobx/mobx.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/data/models/category_model.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_all_ad_usecase/get_all_ad_usecase.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_all_categories_usecase/get_all_categories_usecase.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GetAllAdsUseCaseImp _getAllAdsUseCase;
  final GetAllCategoriesUseCaseImp _getAllCategoriesUseCase;

  _HomeControllerBase(this._getAllAdsUseCase, this._getAllCategoriesUseCase);

  @observable
  List<AdModel> ads = [];

  @observable
  List<CategoryModel> categories = [];

  @observable
  bool loading = false;

  @observable
  CategoryModel? category;

  void checkIfNeedToUpdateList() {
    if (ads.isEmpty) getAllAds();

    // if (categories.isEmpty) getAllCategories();
  }

  @action
  void setCategory(CategoryModel? value) => category = value;

  @action
  Future<void> getAllAds() async {
    loading = true;
    final response = await _getAllAdsUseCase();

    var result = response.fold((l) => l, (r) => r);

    if (result is List<AdModel>)
      ads = result;
    else
      print(result);

    loading = false;
  }

  @action
  Future<void> getAllCategories() async {
    loading = true;
    final response = await _getAllCategoriesUseCase();

    var result = response.fold((l) => l, (r) => r);

    if (result is List<CategoryModel>) {
      categories = result;
      category = categories.first;
    } else
      print(result);

    loading = false;
  }
}
