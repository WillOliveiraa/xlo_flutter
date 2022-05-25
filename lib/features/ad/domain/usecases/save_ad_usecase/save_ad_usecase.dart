import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/save_ad_repository.dart';

abstract class SaveAdUseCase {
  Future<Either<Failure, Unit>> call(AdEntity adEntity);
}

class SaveAdUseCaseImp implements SaveAdUseCase {
  SaveAdUseCaseImp(this._repository);

  final SaveAdRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(AdEntity adEntity) async {
    final result = await _repository.saveAd(adEntity);
    return result;
  }
}
