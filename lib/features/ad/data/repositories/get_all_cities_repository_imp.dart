import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/data/datasources/get_all_cities_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/city_model.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_all_cities.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/get_all_cities_repository.dart';

class GetAllCitiesRepositoryImp implements GetAllCitiesRepository {
  GetAllCitiesRepositoryImp(this._datasource);

  final GetAllCitiesDatasource _datasource;

  @override
  Future<Either<Failure, List<CityModel>>> getAllCities(String ufId) async {
    try {
      return await _datasource.getAllCities(ufId);
    } catch (e) {
      return Left(ErrorGetAllCities());
    }
  }
}
