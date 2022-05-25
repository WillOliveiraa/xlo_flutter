import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/data/datasources/get_all_cities_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/city_model.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_all_cities.dart';

class GetAllCitiesDatasourceImp implements GetAllCitiesDatasource {
  GetAllCitiesDatasourceImp(this._dio);

  final Dio _dio;

  @override
  Future<Either<Failure, List<CityModel>>> getAllCities(String ufId) async {
    final String endpoint =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/$ufId/municipios';

    try {
      final response = await _dio.get<List>(endpoint);

      final cityList = response.data!
          .map<CityModel>((c) => CityModel.fromJson(c as Map<String, dynamic>))
          .toList()
        ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

      return Right(cityList);
    } on DioError {
      return Left(
          ErrorGetAllCities(message: 'Falha ao obter lista de Estados'));
    }
  }
}
