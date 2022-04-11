import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/save_favorite_ad_repository.dart';

abstract class SaveFavoriteAdUseCase {
  Future<Either<Failure, Unit>> call(List<String> adId);
}

class SaveFavoriteAdUseCaseImp implements SaveFavoriteAdUseCase {
  final SaveFavoriteAdRepository _repository;

  SaveFavoriteAdUseCaseImp(this._repository);

  @override
  Future<Either<Failure, Unit>> call(List<String> adId) async {
    return await _repository.saveFavoriteAd(adId);
  }
}
