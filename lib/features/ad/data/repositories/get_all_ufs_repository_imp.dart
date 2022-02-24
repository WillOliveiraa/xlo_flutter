import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/data/datasources/get_all_ufs_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/uf_model.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_all_ufs.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/get_all_ufs_repository.dart';

class GetAllUfsRepositoryImp implements GetAllUfsRepository {
  final GetAllUfsDatasource _datasource;

  GetAllUfsRepositoryImp(this._datasource);

  @override
  Future<Either<Failure, List<UfModel>>> getAllUfs() async {
    try {
      return await _datasource.getAllUfs();
    } catch (e) {
      return Left(ErrorGetAllUfs());
    }
  }
}
