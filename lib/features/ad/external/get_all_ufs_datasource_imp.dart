import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/data/datasources/get_all_ufs_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/uf_model.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_all_ufs.dart';

class GetAllUfsDatasourceImp implements GetAllUfsDatasource {
  GetAllUfsDatasourceImp(this._dio);

  final Dio _dio;

  @override
  Future<Either<Failure, List<UfModel>>> getAllUfs() async {
    final preferences = await SharedPreferences.getInstance();

    if (preferences.containsKey('UF_LIST')) {
      final jsonJ = json.decode(preferences.get('UF_LIST')! as String);

      // ignore: avoid_dynamic_calls
      return Right(jsonJ
          .map<UfModel>((j) => UfModel.fromJson(j as Map<String, dynamic>))
          .toList() as List<UfModel>
        ..sort((UfModel a, UfModel b) =>
            a.name.toLowerCase().compareTo(b.name.toLowerCase())));
    }

    try {
      const endpoint =
          'https://servicodados.ibge.gov.br/api/v1/localidades/estados';

      final response = await _dio.get<List>(endpoint);

      preferences.setString('UF_LIST', json.encode(response.data));

      final ufList = response.data!
          .map<UfModel>((j) => UfModel.fromJson(j as Map<String, dynamic>))
          .toList()
        ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

      return Right(ufList);
    } on DioError {
      return Left(ErrorGetAllUfs(message: 'Falha ao obter lista de Estados'));
    }
  }
}
