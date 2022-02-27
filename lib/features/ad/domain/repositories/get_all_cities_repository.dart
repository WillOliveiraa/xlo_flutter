import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/domain/entities/city_entity.dart';

abstract class GetAllCitiesRepository {
  Future<Either<Failure, List<CityEntity>>> getAllCities(String ufId);
}
