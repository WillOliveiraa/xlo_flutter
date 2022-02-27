import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/ad/data/datasources/get_all_cities_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/city_model.dart';
import 'package:xlo_flutter/features/ad/data/repositories/get_all_cities_repository_imp.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_all_cities.dart';

class GetAllCitiesDatasourceMock extends Mock
    implements GetAllCitiesDatasource {}

void main() {
  final datasource = GetAllCitiesDatasourceMock();
  final repository = GetAllCitiesRepositoryImp(datasource);
  final ufId = '123';
  final cities = [
    CityModel(name: 'Terra Boa'),
  ];

  test('should get all Cities', () async {
    when(() => datasource.getAllCities(ufId))
        .thenAnswer((_) async => Right(cities));

    final result = await repository.getAllCities(ufId);

    expect(result, isA<Right<dynamic, List<CityModel>>>());
    verify(() => datasource.getAllCities(ufId)).called(1);
    verifyNoMoreInteractions(datasource);
  });

  test('should return a ErrorGetAllCities', () async {
    when(() => datasource.getAllCities(ufId))
        .thenAnswer((_) async => Left(ErrorGetAllCities()));

    final result = (await repository.getAllCities(ufId)).fold(id, id);

    expect(result, isA<ErrorGetAllCities>());
    verify(() => datasource.getAllCities(ufId)).called(1);
    verifyNoMoreInteractions(datasource);
  });
}
