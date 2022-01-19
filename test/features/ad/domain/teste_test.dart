import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/ad/data/datasources/save_ad_datasource.dart';
import 'package:xlo_flutter/features/ad/domain/data/repositories/save_ad_repository_imp.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';

class SaveAdDatasourceMock extends Mock implements SaveAdDatasource {}

void main() {
  final datasource = SaveAdDatasourceMock();
  final respository = SaveAdRepositoryImp(datasource);
  final adEntity = AdEntity(
    title: 'Novo anuncio',
    description: 'descrição do anuncio',
    price: 350.00,
    images: [],
  );

  test('should save a ad', () async {
    when(() => datasource.saveAd(adEntity))
        .thenAnswer((_) async => Right(unit));

    final result = await respository.saveAd(adEntity);

    expect(result, isA<Right<dynamic, Unit>>());
  });
}
