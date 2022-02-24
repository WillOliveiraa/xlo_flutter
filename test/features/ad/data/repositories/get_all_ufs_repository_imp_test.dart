import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/ad/data/datasources/get_all_ufs_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/uf_model.dart';
import 'package:xlo_flutter/features/ad/data/repositories/get_all_ufs_repository_imp.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_all_ufs.dart';

class GetAllUfsDatasourceMock extends Mock implements GetAllUfsDatasource {}

void main() {
  final datasource = GetAllUfsDatasourceMock();
  final repository = GetAllUfsRepositoryImp(datasource);
  final ufs = [
    UfModel(initials: 'PR', name: 'Paraná'),
  ];

  test('should get all Ufs', () async {
    when(() => datasource.getAllUfs()).thenAnswer((_) async => Right(ufs));

    final result = await repository.getAllUfs();

    expect(result, isA<Right<dynamic, List<UfModel>?>>());
    verify(() => datasource.getAllUfs()).called(1);
    verifyNoMoreInteractions(datasource);
  });

  test('should return a ErrorGetAllUfs', () async {
    when(() => datasource.getAllUfs())
        .thenAnswer((_) async => Left(ErrorGetAllUfs()));

    final result = (await repository.getAllUfs()).fold(id, id);

    expect(result, isA<ErrorGetAllUfs>());
    verify(() => datasource.getAllUfs()).called(1);
    verifyNoMoreInteractions(datasource);
  });
}
