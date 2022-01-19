import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_save_ad.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/save_ad_repository.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/save_ad_usecase/save_ad_usecase_imp.dart';

class SaveAdRepositoryMock extends Mock implements SaveAdRespository {}

void main() {
  final repository = SaveAdRepositoryMock();
  final usecase = SaveAdUseCaseImp(repository);
  final adEntity = AdEntity(
    title: 'Novo anuncio',
    description: 'descrição do anuncio',
    price: 350.00,
    images: [],
  );

  test('should save the ad', () async {
    when(() => repository.saveAd(adEntity))
        .thenAnswer((_) async => Right(unit));

    final result = (await usecase(adEntity)).fold((l) => null, (r) => r);

    expect(result, unit);
  });

  test('should return a error', () async {
    when(() => repository.saveAd(adEntity))
        .thenAnswer((_) async => Left(ErrorSaveAd()));

    final result = (await usecase(adEntity)).fold(id, id);

    expect(result, isA<ErrorSaveAd>());
  });
}
