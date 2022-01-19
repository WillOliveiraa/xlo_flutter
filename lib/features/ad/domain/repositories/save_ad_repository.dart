import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';

abstract class SaveAdRespository {
  Future<Either<Failure, Unit>> saveAd(AdEntity adEntity);
}
