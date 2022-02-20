import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/ad/data/datasources/get_all_ads_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/data/models/category_model.dart';
import 'package:xlo_flutter/features/ad/data/repositories/get_all_ads_repository_imp.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_all_ads.dart';

class GetAllAdsDatasourceMock extends Mock implements GetAllAdsDatasource {}

void main() {
  final datasource = GetAllAdsDatasourceMock();
  final respository = GetAllAdsRepositoryImp(datasource);
  final adList = [
    AdModel(
      title: 'Novo anuncio',
      description: 'descrição do anuncio',
      price: 350.00,
      images: [''],
      category: CategoryModel(description: 'new description'),
    ),
  ];

  test('should get all Ads', () async {
    when(() => datasource.getAllAds()).thenAnswer((_) async => Right(adList));

    final result = await respository.getAllAds();

    expect(result, isA<Right<dynamic, List<AdModel>?>>());
  });

  test('should return a ErrorGetAllAds', () async {
    when(() => datasource.getAllAds())
        .thenThrow((_) async => Left(ErrorGetAllAds()));

    final result = (await respository.getAllAds()).fold(id, id);

    expect(result, isA<ErrorGetAllAds>());
  });
}
