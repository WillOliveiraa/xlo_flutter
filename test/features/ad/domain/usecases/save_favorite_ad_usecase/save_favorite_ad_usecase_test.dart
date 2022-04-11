import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_save_favorite_ad.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/save_favorite_ad_repository.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/save_favorite_ad_usecase/save_favorite_ad_usecase.dart';

class SaveFavoriteAdRepositoryMock extends Mock
    implements SaveFavoriteAdRepository {}

void main() {
  final repository = SaveFavoriteAdRepositoryMock();
  final usecase = SaveFavoriteAdUseCaseImp(repository);
  final adIds = ['adIds'];

  test('should save a favorite ad', () async {
    when(() => repository.saveFavoriteAd(adIds))
        .thenAnswer((_) async => Right(unit));

    final result = (await usecase(adIds)).fold((l) => null, (r) => r);

    expect(result, unit);
  });

  test('should return a ErrorSaveFavoriteAd', () async {
    when(() => repository.saveFavoriteAd(adIds))
        .thenAnswer((_) async => Left(ErrorSaveFavoriteAd()));

    final result = (await usecase(adIds)).fold(id, id);

    expect(result, isA<ErrorSaveFavoriteAd>());
  });
}
