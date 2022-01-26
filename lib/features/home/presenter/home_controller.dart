import 'package:flutter/material.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_all_ad_usecase/get_all_ad_usecase.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/save_ad_usecase/save_ad_usecase.dart';

import 'ad_state.dart';

class HomeController extends ValueNotifier<AdState> {
  final SaveAdUseCaseImp _saveAdUseCase;
  final GetAllAdsUseCaseImp _getAllAdsUseCase;

  HomeController(this._saveAdUseCase, this._getAllAdsUseCase)
      : super(InitialAdState());

  Future<void> saveAd() async {
    final ad = AdEntity(
      title: 'Novo anuncio Willian',
      description: 'Teeste para funfar agora',
      images: [''],
      price: 150.00,
    );

    final response = await _saveAdUseCase(ad);

    var result = response.fold((l) => l, (r) => r);
    print(result);
  }

  Future<void> getAllAds() async {
    final response = await _getAllAdsUseCase();

    var result = response.fold((l) => l, (r) => r);
    print(result);
  }
}
