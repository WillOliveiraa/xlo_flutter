import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/data/models/city_model.dart';

abstract class GetAllCitiesDatasource {
  Future<Either<Failure, List<CityModel>>> getAllCities();
}
