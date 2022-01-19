import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';

abstract class GetAllAdsDatasource {
  Future<Either<Failure, List<AdModel>?>> getAllAds();
}
