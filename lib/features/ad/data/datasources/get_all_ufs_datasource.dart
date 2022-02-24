import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/data/models/uf_model.dart';

abstract class GetAllUfsDatasource {
  Future<Either<Failure, List<UfModel>>> getAllUfs();
}
