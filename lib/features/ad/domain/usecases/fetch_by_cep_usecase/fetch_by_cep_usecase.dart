import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/domain/entities/address_entity.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/fetch_by_cep_repository.dart';

abstract class FetchByCepUseCase {
  Future<Either<Failure, AddressEntity>> call(String cep);
}

class FetchByCepUseCaseImp implements FetchByCepUseCase {
  FetchByCepUseCaseImp(this._repository);

  final FetchByCepRepository _repository;

  @override
  Future<Either<Failure, AddressEntity>> call(String cep) async {
    final result = await _repository.fetchByCep(cep);
    return result;
  }
}
