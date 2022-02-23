import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/domain/entities/address_entity.dart';

abstract class FetchByCepRepository {
  Future<Either<Failure, AddressEntity>> fetchByCep(String cep);
}
