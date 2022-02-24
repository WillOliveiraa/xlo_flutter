import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/ad/domain/entities/city_entity.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_all_cities.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/get_all_cities_repository.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_all_cities_usecase/get_all_cities_usecase.dart';

class GetAllCitiesRepositoryMock extends Mock
    implements GetAllCitiesRepository {}

void main() {
  final repository = GetAllCitiesRepositoryMock();
  final usecase = GetAllCitiesUseCaseImp(repository);
  final ufList = [
    CityEntity(name: 'Terra Boa'),
  ];

  test('should get all Cities', () async {
    when(() => repository.getAllCities())
        .thenAnswer((_) async => Right(ufList));

    final result = (await usecase()).fold((l) => null, (r) => r);

    expect(result, isA<List<CityEntity>>());
  });

  test('should return a ErrorGetAllCities', () async {
    when(() => repository.getAllCities())
        .thenAnswer((_) async => Left(ErrorGetAllCities()));

    final result = (await usecase()).fold(id, id);

    expect(result, isA<ErrorGetAllCities>());
  });
}
