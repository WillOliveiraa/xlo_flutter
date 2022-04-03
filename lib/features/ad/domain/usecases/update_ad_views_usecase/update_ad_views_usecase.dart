import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/update_ad_views_repository.dart';

abstract class UpdateAdViewsUseCase {
  Future<Either<Failure, Unit>> call(
      {required String adId, required int views});
}

class UpdateAdViewsUseCaseImp implements UpdateAdViewsUseCase {
  final UpdateAdViewsRepository _repository;

  UpdateAdViewsUseCaseImp(this._repository);

  @override
  Future<Either<Failure, Unit>> call(
      {required String adId, required int views}) async {
    return await _repository.updateAdViews(adId: adId, views: views);
  }
}
