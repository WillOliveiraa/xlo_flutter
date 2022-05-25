import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/ad/data/datasources/update_ad_views_datasource.dart';
import 'package:xlo_flutter/features/ad/data/repositories/update_ad_views_repository_imp.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_update_ad_views.dart';

class UpdateAdViewsDatasourceMock extends Mock
    implements UpdateAdViewsDatasource {}

void main() {
  final datasource = UpdateAdViewsDatasourceMock();
  final repository = UpdateAdViewsRepositoryImp(datasource);
  const adViews = 1;
  const adId = 'adId';

  test('should update ad Views', () async {
    when(() => datasource.updateAdViews(adId: adId, views: adViews))
        .thenAnswer((_) async => const Right(unit));

    final result = await repository.updateAdViews(adId: adId, views: adViews);

    expect(result, isA<Right<dynamic, Unit>>());
    verify(() => datasource.updateAdViews(adId: adId, views: adViews))
        .called(1);
    verifyNoMoreInteractions(datasource);
  });

  test('should return a ErrorUpdateAdViews', () async {
    when(() => datasource.updateAdViews(adId: adId, views: adViews))
        .thenAnswer((_) async => Left(ErrorUpdateAdViews()));

    final result = (await repository.updateAdViews(adId: adId, views: adViews))
        .fold(id, id);

    expect(result, isA<ErrorUpdateAdViews>());
    verify(() => datasource.updateAdViews(adId: adId, views: adViews))
        .called(1);
    verifyNoMoreInteractions(datasource);
  });
}
