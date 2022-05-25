import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/ad/domain/entities/address_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/city_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/uf_entity.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_fetch_by_cep.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/fetch_by_cep_repository.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/fetch_by_cep_usecase/fetch_by_cep_usecase.dart';

class FetchByCepRepositoryMock extends Mock implements FetchByCepRepository {}

void main() {
  final repository = FetchByCepRepositoryMock();
  final usecase = FetchByCepUseCaseImp(repository);
  const cep = '87240000';
  final address = AddressEntity(
    uf: UfEntity(initials: 'PR', name: 'Paraná'),
    city: CityEntity(name: 'Terra Boa'),
    cep: '8724000',
    district: 'abc',
  );

  test('should get a address', () async {
    when(() => repository.fetchByCep(cep))
        .thenAnswer((_) async => Right(address));

    final result = (await usecase(cep)).fold((l) => null, (r) => r);

    expect(result, isA<AddressEntity>());
  });

  test('should return a ErrorFetchByCep', () async {
    when(() => repository.fetchByCep(cep))
        .thenAnswer((_) async => Left(ErrorFetchByCep()));

    final result = (await usecase(cep)).fold(id, id);

    expect(result, isA<ErrorFetchByCep>());
  });
}
