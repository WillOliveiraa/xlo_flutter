import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';

import 'features/ad/domain/usecases/save_ad_usecase/save_ad_usecase.dart';

class TestController {
  final SaveAdUseCaseImp _usecase;

  TestController(this._usecase);

  Future<void> saveAd() async {
    final ad = AdEntity(
      title: 'Test Will',
      description: 'Mais um teste para funfar',
      images: [''],
      price: 100.00,
    );
    final response = await _usecase(ad);

    var result = response.fold((l) => l, (r) => r);
  }
}
