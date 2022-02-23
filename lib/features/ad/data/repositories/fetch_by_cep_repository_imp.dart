import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/data/datasources/fetch_by_cep_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/address_model.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_fetch_by_cep.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/fetch_by_cep_repository.dart';

class FetchByCepRepositoryImp extends FetchByCepRepository {
  final FetchByCepDatasource _datasource;

  FetchByCepRepositoryImp(this._datasource);

  @override
  Future<Either<Failure, AddressModel>> fetchByCep(String cep) async {
    try {
      return await _datasource.fetchByCep(cep);
    } catch (e) {
      return Left(ErrorFetchByCep());
    }
  }
}
