import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/remove_favorite_ad_repository.dart';

abstract class RemoveFavoriteAdUseCase {
  Future<Either<Failure, Unit>> call(
      {required String adId, required String userId});
}

class RemoveFavoriteAdUseCaseImp implements RemoveFavoriteAdUseCase {
  final RemoveFavoriteAdRepository _repository;

  RemoveFavoriteAdUseCaseImp(this._repository);

  @override
  Future<Either<Failure, Unit>> call(
      {required String adId, required String userId}) async {
    return await _repository.removeFavoriteAd(adId: adId, userId: userId);
  }
}
