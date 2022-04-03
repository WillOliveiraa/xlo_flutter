import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_update_ad_views.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/update_ad_views_repository.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/update_ad_views_usecase/update_ad_views_usecase.dart';

class UpdateAdViewsRepositoryMock extends Mock
    implements UpdateAdViewsRepository {}

void main() {
  final repository = UpdateAdViewsRepositoryMock();
  final usecase = UpdateAdViewsUseCaseImp(repository);
  final adViews = 1;
  final adId = 'adId';

  test('should update ad Views', () async {
    when(() => repository.updateAdViews(adId: adId, views: adViews))
        .thenAnswer((_) async => Right(unit));

    final result =
        (await usecase(adId: adId, views: adViews)).fold((l) => null, (r) => r);

    expect(result, unit);
  });

  test('should return a ErrorUpdateAdViews', () async {
    when(() => repository.updateAdViews(adId: adId, views: adViews))
        .thenAnswer((_) async => Left(ErrorUpdateAdViews()));

    final result = (await usecase(adId: adId, views: adViews)).fold(id, id);

    expect(result, isA<ErrorUpdateAdViews>());
  });
}
