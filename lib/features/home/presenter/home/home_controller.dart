import 'package:mobx/mobx.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_all_ad_usecase/get_all_ad_usecase.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GetAllAdsUseCaseImp _getAllAdsUseCase;

  _HomeControllerBase(this._getAllAdsUseCase);

  @observable
  List<AdModel> ads = [];

  @action
  Future<void> getAllAds() async {
    final response = await _getAllAdsUseCase();

    var result = response.fold((l) => l, (r) => r);

    if (result is List<AdModel>)
      ads = result;
    else
      print(result);
  }
}
