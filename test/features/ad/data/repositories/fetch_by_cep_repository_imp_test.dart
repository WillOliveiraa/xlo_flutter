import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/ad/data/datasources/fetch_by_cep_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/address_model.dart';
import 'package:xlo_flutter/features/ad/data/models/city_model.dart';
import 'package:xlo_flutter/features/ad/data/models/uf_model.dart';
import 'package:xlo_flutter/features/ad/data/repositories/fetch_by_cep_repository_imp.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_fetch_by_cep.dart';

class FetchByCepDatasourceMock extends Mock implements FetchByCepDatasource {}

void main() {
  final datasource = FetchByCepDatasourceMock();
  final respository = FetchByCepRepositoryImp(datasource);
  final cep = '87240000';
  final address = AddressModel(
    uf: UfModel(initials: 'PR', name: 'Paraná'),
    city: CityModel(name: 'Terra Boa'),
    cep: '8724000',
    district: 'abc',
  );

  test('should get address', () async {
    when(() => datasource.fetchByCep(cep))
        .thenAnswer((_) async => Right(address));

    final result = await respository.fetchByCep(cep);

    expect(result, isA<Right<dynamic, AddressModel>>());
  });

  test('should return a ErrorFetchByCep', () async {
    when(() => datasource.fetchByCep(cep))
        .thenThrow((_) async => Left(ErrorFetchByCep()));

    final result = (await respository.fetchByCep(cep)).fold(id, id);

    expect(result, isA<ErrorFetchByCep>());
  });
}
