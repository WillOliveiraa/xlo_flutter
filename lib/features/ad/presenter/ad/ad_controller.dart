import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';

import 'package:xlo_flutter/features/ad/domain/usecases/update_ad_views_usecase/update_ad_views_usecase.dart';

part 'ad_controller.g.dart';

class AdController = _AdControllerBase with _$AdController;

abstract class _AdControllerBase with Store {
  final UpdateAdViewsUseCaseImp _adViewsUseCase;

  _AdControllerBase(this._adViewsUseCase);

  @action
  Future<void> updateViews(AdModel ad) async {
    final response = await _adViewsUseCase(
        adId: ad.id!, views: ad.views != null ? ad.views! + 1 : 1);

    response.fold((failure) {
      asuka.showSnackBar(SnackBar(content: Text(failure.message!)));
    }, (_) {});
  }
}
