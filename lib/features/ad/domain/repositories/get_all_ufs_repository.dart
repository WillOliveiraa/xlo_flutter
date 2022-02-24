import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/domain/entities/uf_entity.dart';

abstract class GetAllUfsRepository {
  Future<Either<Failure, List<UfEntity>>> getAllUfs();
}
