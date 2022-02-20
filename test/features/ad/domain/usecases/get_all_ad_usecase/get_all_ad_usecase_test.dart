import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/category_entity.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_all_ads.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/get_all_ads_repository.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_all_ad_usecase/get_all_ad_usecase.dart';

class GetAllAdsRepositoryMock extends Mock implements GetAllAdsRepository {}

void main() {
  final repository = GetAllAdsRepositoryMock();
  final usecase = GetAllAdsUseCaseImp(repository);
  final adList = [
    AdEntity(
      title: 'Novo anuncio',
      description: 'descrição do anuncio',
      price: 350.00,
      images: [''],
      category: CategoryEntity(description: 'new description'),
    ),
  ];

  test('should get all ads', () async {
    when(() => repository.getAllAds()).thenAnswer((_) async => Right(adList));

    final result = (await usecase()).fold((l) => null, (r) => r);

    expect(result, isA<List<AdEntity>>());
  });

  test('should return a ErrorGetAllAds', () async {
    when(() => repository.getAllAds())
        .thenAnswer((_) async => Left(ErrorGetAllAds()));

    final result = (await usecase()).fold(id, id);

    expect(result, isA<ErrorGetAllAds>());
  });
}
