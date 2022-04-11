import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/ad/data/datasources/save_favorite_ad_datasource.dart';
import 'package:xlo_flutter/features/ad/data/repositories/save_favorite_ad_repository_imp.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_save_favorite_ad.dart';

class SaveFavoriteAdDatasourceMock extends Mock
    implements SaveFavoriteAdDatasource {}

void main() {
  final datasource = SaveFavoriteAdDatasourceMock();
  final respository = SaveFavoriteAdRepositoryImp(datasource);
  final adIds = ['adIds'];

  test('should save a ad', () async {
    when(() => datasource.saveFavoriteAd(adIds))
        .thenAnswer((_) async => Right(unit));

    final result = await respository.saveFavoriteAd(adIds);

    expect(result, isA<Right<dynamic, Unit>>());
    verify(() => datasource.saveFavoriteAd(adIds)).called(1);
    verifyNoMoreInteractions(datasource);
  });

  test('should return a ErrorSaveFavoriteAd', () async {
    when(() => datasource.saveFavoriteAd(adIds))
        .thenAnswer((_) async => Left(ErrorSaveFavoriteAd()));

    final result = (await respository.saveFavoriteAd(adIds)).fold(id, id);

    expect(result, isA<ErrorSaveFavoriteAd>());
    verify(() => datasource.saveFavoriteAd(adIds)).called(1);
    verifyNoMoreInteractions(datasource);
  });
}
