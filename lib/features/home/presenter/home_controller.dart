import 'package:flutter/material.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_all_ad_usecase/get_all_ad_usecase.dart';

import 'ad_state.dart';

class HomeController extends ValueNotifier<AdState> {
  final GetAllAdsUseCaseImp _getAllAdsUseCase;

  List<AdModel> ads = [];

  HomeController(this._getAllAdsUseCase) : super(InitialAdState());

  Future<void> getAllAds() async {
    final response = await _getAllAdsUseCase();

    var result = response.fold((l) => l, (r) => r);

    if (result is List<AdModel>)
      ads = result;
    else
      print(result);
    notifyListeners();
  }
}
