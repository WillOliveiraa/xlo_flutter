import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/data/datasources/fetch_by_cep_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/address_model.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_fetch_by_cep.dart';

class FetchByCepDatasourceImp implements FetchByCepDatasource {
  FetchByCepDatasourceImp(this._dio);

  final Dio _dio;

  @override
  Future<Either<Failure, AddressModel>> fetchByCep(String cep) async {
    if (cep.isEmpty) return Left(ErrorFetchByCep(message: 'CEP inválido'));

    final clearCep = cep.replaceAll(RegExp('[^0-9]'), '');
    if (clearCep.length != 8) return Future.error('CEP inválido');

    final endpoint = 'https://viacep.com.br/ws/$clearCep/json';

    try {
      final response = await _dio.get<Map>(endpoint);
      if (response.data != null &&
          response.data!.containsKey('erro') &&
          response.data!['erro'] == true) {
        return Left(ErrorFetchByCep(message: 'CEP inválido'));
      }

      return Right(AddressModel.fromMap(response.data!));
    } catch (e) {
      return Left(
          ErrorFetchByCep(message: 'Ocorreu um erro ao tentar buscar o cep'));
    }
  }
}
