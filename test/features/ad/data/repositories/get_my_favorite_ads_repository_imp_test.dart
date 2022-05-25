import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/ad/data/datasources/get_my_favorite_ads_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/data/models/address_model.dart';
import 'package:xlo_flutter/features/ad/data/models/category_model.dart';
import 'package:xlo_flutter/features/ad/data/models/city_model.dart';
import 'package:xlo_flutter/features/ad/data/models/uf_model.dart';
import 'package:xlo_flutter/features/ad/data/repositories/get_my_favorite_ads_repository_imp.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_my_favorite_ads.dart';
import 'package:xlo_flutter/features/auth/data/models/user_model.dart';

class GetMyFavoriteAdsDatasourceMock extends Mock
    implements GetMyFavoriteAdsDatasource {}

void main() {
  final datasource = GetMyFavoriteAdsDatasourceMock();
  final respository = GetMyFavoriteAdsRepositoryImp(datasource);
  const userId = 'userID';
  final adList = [
    AdModel(
      title: 'Novo anuncio',
      description: 'descrição do anuncio',
      price: 350.00,
      status: AdStatus.active,
      images: [''],
      category: CategoryModel(description: 'new description'),
      owner: UserModel(name: '', email: ''),
      address: AddressModel(
        uf: UfModel(initials: '', name: ''),
        city: CityModel(name: ''),
        cep: '',
        district: '',
      ),
    ),
  ];

  test('should get my favorite Ads', () async {
    when(() => datasource.getMyFavoriteAds(userId))
        .thenAnswer((_) async => Right(adList));

    final result = await respository.getMyFavoriteAds(userId);

    expect(result, isA<Right<dynamic, List<AdModel>>>());
    verify(() => datasource.getMyFavoriteAds(userId)).called(1);
    verifyNoMoreInteractions(datasource);
  });

  test('should return a ErrorGetMyFavoriteAds', () async {
    when(() => datasource.getMyFavoriteAds(userId))
        .thenThrow((_) async => Left(ErrorGetMyFavoriteAds()));

    final result = (await respository.getMyFavoriteAds(userId)).fold(id, id);

    expect(result, isA<ErrorGetMyFavoriteAds>());
    verify(() => datasource.getMyFavoriteAds(userId)).called(1);
    verifyNoMoreInteractions(datasource);
  });
}
