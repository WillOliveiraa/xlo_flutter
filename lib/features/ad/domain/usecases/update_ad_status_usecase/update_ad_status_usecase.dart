import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/update_ad_status_repository.dart';

abstract class UpdateAdStatusUseCase {
  Future<Either<Failure, Unit>> call(
      {required String adId, required AdStatus adStatus});
}

class UpdateAdStatusUseCaseImp implements UpdateAdStatusUseCase {
  UpdateAdStatusUseCaseImp(this._repository);

  final UpdateAdStatusRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(
      {required String adId, required AdStatus adStatus}) async {
    final result =
        await _repository.updateAdStatus(adId: adId, adStatus: adStatus);
    return result;
  }
}
