import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_remove_favorite_ad.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/remove_favorite_ad_repository.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/remove_favorite_ad_usecase/remove_favorite_ad_usecase.dart';

class RemoveFavoriteAdRepositoryMock extends Mock
    implements RemoveFavoriteAdRepository {}

void main() {
  final repository = RemoveFavoriteAdRepositoryMock();
  final usecase = RemoveFavoriteAdUseCaseImp(repository);
  const adId = 'adId';
  const userId = 'userId';

  test('should remove a favorite ad', () async {
    when(() => repository.removeFavoriteAd(adId: adId, userId: userId))
        .thenAnswer((_) async => const Right(unit));

    final result =
        (await usecase(adId: adId, userId: userId)).fold((l) => null, (r) => r);

    expect(result, unit);
  });

  test('should return a ErrorRemoveFavoriteAd', () async {
    when(() => repository.removeFavoriteAd(adId: adId, userId: userId))
        .thenAnswer((_) async => Left(ErrorRemoveFavoriteAd()));

    final result = (await usecase(adId: adId, userId: userId)).fold(id, id);

    expect(result, isA<ErrorRemoveFavoriteAd>());
  });
}
