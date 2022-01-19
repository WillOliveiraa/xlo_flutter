import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/save_ad_repository.dart';

abstract class SaveAdUseCase {
  Future<Either<Failure, Unit>> call(AdEntity adEntity);
}

class SaveAdUseCaseImp implements SaveAdUseCase {
  final SaveAdRespository _repository;

  SaveAdUseCaseImp(this._repository);

  @override
  Future<Either<Failure, Unit>> call(AdEntity adEntity) async {
    return await _repository.saveAd(adEntity);
  }
}
