import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/domain/entities/uf_entity.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/get_all_ufs_repository.dart';

abstract class GetAllUfsUseCase {
  Future<Either<Failure, List<UfEntity>>> call();
}

class GetAllUfsUseCaseImp implements GetAllUfsUseCase {
  GetAllUfsUseCaseImp(this._repository);

  final GetAllUfsRepository _repository;

  @override
  Future<Either<Failure, List<UfEntity>>> call() async {
    final result = await _repository.getAllUfs();
    return result;
  }
}
