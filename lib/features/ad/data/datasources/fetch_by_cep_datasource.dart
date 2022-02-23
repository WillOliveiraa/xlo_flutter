import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/data/models/address_model.dart';

abstract class FetchByCepDatasource {
  Future<Either<Failure, AddressModel>> fetchByCep(String cep);
}
