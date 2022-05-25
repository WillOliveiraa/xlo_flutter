import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/save_favorite_ad_repository.dart';

abstract class SaveFavoriteAdUseCase {
  Future<Either<Failure, Unit>> call(
      {required String adId, required String userId});
}

class SaveFavoriteAdUseCaseImp implements SaveFavoriteAdUseCase {
  SaveFavoriteAdUseCaseImp(this._repository);

  final SaveFavoriteAdRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(
      {required String adId, required String userId}) async {
    final result = await _repository.saveFavoriteAd(adId: adId, userId: userId);
    return result;
  }
}
