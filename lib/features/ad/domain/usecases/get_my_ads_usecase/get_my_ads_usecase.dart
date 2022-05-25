import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/get_my_ads_repository.dart';

abstract class GetMyAdsUseCase {
  Future<Either<Failure, List<AdEntity>>> call();
}

class GetMyAdsUseCaseImp implements GetMyAdsUseCase {
  GetMyAdsUseCaseImp(this._repository);

  final GetMyAdsRepository _repository;

  @override
  Future<Either<Failure, List<AdEntity>>> call() async {
    final result = await _repository.getMyAds();
    return result;
  }
}
