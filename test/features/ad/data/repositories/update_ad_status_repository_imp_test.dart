import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/ad/data/datasources/update_ad_status_datasource.dart';
import 'package:xlo_flutter/features/ad/data/repositories/update_ad_status_repository_imp.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_update_ad_status.dart';

class UpdateAdStatusDatasourceMock extends Mock
    implements UpdateAdStatusDatasource {}

void main() {
  final datasource = UpdateAdStatusDatasourceMock();
  final repository = UpdateAdStatusRepositoryImp(datasource);
  const adStatus = AdStatus.sold;
  const adId = 'adId';

  test('should update ad status', () async {
    when(() => datasource.updateAdStatus(adId: adId, adStatus: adStatus))
        .thenAnswer((_) async => const Right(unit));

    final result =
        await repository.updateAdStatus(adId: adId, adStatus: adStatus);

    expect(result, isA<Right<dynamic, Unit>>());
    verify(() => datasource.updateAdStatus(adId: adId, adStatus: adStatus))
        .called(1);
    verifyNoMoreInteractions(datasource);
  });

  test('should return a ErrorUpdateAdStatus', () async {
    when(() => datasource.updateAdStatus(adId: adId, adStatus: adStatus))
        .thenAnswer((_) async => Left(ErrorUpdateAdStatus()));

    final result =
        (await repository.updateAdStatus(adId: adId, adStatus: adStatus))
            .fold(id, id);

    expect(result, isA<ErrorUpdateAdStatus>());
    verify(() => datasource.updateAdStatus(adId: adId, adStatus: adStatus))
        .called(1);
    verifyNoMoreInteractions(datasource);
  });
}
