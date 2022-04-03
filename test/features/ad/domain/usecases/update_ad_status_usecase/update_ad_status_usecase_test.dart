import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_update_ad_status.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/update_ad_status_repository.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/update_ad_status_usecase/update_ad_status_usecase.dart';

class UpdateAdStatusRepositoryMock extends Mock
    implements UpdateAdStatusRepository {}

void main() {
  final repository = UpdateAdStatusRepositoryMock();
  final usecase = UpdateAdStatusUseCaseImp(repository);
  final adStatus = AdStatus.SOLD;
  final adId = 'adId';

  test('should update ad status', () async {
    when(() => repository.updateAdStatus(adId: adId, adStatus: adStatus))
        .thenAnswer((_) async => Right(unit));

    final result = (await usecase(adId: adId, adStatus: adStatus))
        .fold((l) => null, (r) => r);

    expect(result, unit);
  });

  test('should return a ErrorUpdateAdStatus', () async {
    when(() => repository.updateAdStatus(adId: adId, adStatus: adStatus))
        .thenAnswer((_) async => Left(ErrorUpdateAdStatus()));

    final result = (await usecase(adId: adId, adStatus: adStatus)).fold(id, id);

    expect(result, isA<ErrorUpdateAdStatus>());
  });
}
