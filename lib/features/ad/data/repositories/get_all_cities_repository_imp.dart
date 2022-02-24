import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/data/datasources/get_all_cities_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/city_model.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_all_cities.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/get_all_cities_repository.dart';

class GetAllCitiesRepositoryImp implements GetAllCitiesRepository {
  final GetAllCitiesDatasource _datasource;

  GetAllCitiesRepositoryImp(this._datasource);

  @override
  Future<Either<Failure, List<CityModel>>> getAllCities() async {
    try {
      return await _datasource.getAllCities();
    } catch (e) {
      return Left(ErrorGetAllCities());
    }
  }
}
