import 'package:asuka/asuka.dart' as asuka;
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/core/shared/widgets/custom_snack_bar_content.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/update_ad_views_usecase/update_ad_views_usecase.dart';

part 'ad_controller.g.dart';

class AdController = _AdControllerBase with _$AdController;

abstract class _AdControllerBase with Store {
  _AdControllerBase(this._adViewsUseCase);

  final UpdateAdViewsUseCaseImp _adViewsUseCase;

  @action
  Future<void> updateViews(AdModel ad) async {
    final Either<Failure, Unit> response = await _adViewsUseCase(
      adId: ad.id!,
      views: ad.views != null ? ad.views! + 1 : 1,
    );

    response.fold(
      (Failure failure) {
        asuka.showSnackBar(
          SnackBar(
            content: CustomSnackBarContent(textError: failure.message!),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
      },
      (_) {},
    );
  }
}
