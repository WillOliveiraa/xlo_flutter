import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/ad/domain/entities/uf_entity.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_all_ufs.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/get_all_ufs_repository.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_all_ufs_usecase/get_all_ufs_usecase.dart';

class GetAllUfsRepositoryMock extends Mock implements GetAllUfsRepository {}

void main() {
  final repository = GetAllUfsRepositoryMock();
  final usecase = GetAllUfsUseCaseImp(repository);
  final ufList = [
    UfEntity(initials: 'PR', name: 'Paraná'),
  ];

  test('should get all Ufs', () async {
    when(() => repository.getAllUfs()).thenAnswer((_) async => Right(ufList));

    final result = (await usecase()).fold((l) => null, (r) => r);

    expect(result, isA<List<UfEntity>>());
  });

  test('should return a ErrorGetAllUfs', () async {
    when(() => repository.getAllUfs())
        .thenAnswer((_) async => Left(ErrorGetAllUfs()));

    final result = (await usecase()).fold(id, id);

    expect(result, isA<ErrorGetAllUfs>());
  });
}
