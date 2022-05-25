import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/get_all_ads_repository.dart';

abstract class GetAllAdsUseCase {
  Future<Either<Failure, List<AdEntity>?>> call();
}

class GetAllAdsUseCaseImp implements GetAllAdsUseCase {
  GetAllAdsUseCaseImp(this._repository);

  final GetAllAdsRepository _repository;

  @override
  Future<Either<Failure, List<AdEntity>?>> call() async {
    final result = await _repository.getAllAds();
    return result;
  }
}
