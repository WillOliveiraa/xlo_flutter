import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/ad/data/datasources/get_filtered_ads_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_filter_model.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/data/models/address_model.dart';
import 'package:xlo_flutter/features/ad/data/models/category_model.dart';
import 'package:xlo_flutter/features/ad/data/models/city_model.dart';
import 'package:xlo_flutter/features/ad/data/models/uf_model.dart';
import 'package:xlo_flutter/features/ad/data/repositories/get_filtered_ads_repository_imp.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_filter_entity.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_filtered_ads.dart';
import 'package:xlo_flutter/features/auth/data/models/user_model.dart';

class GetFilteredAdsDatasourceMock extends Mock
    implements GetFilteredAdsDatasource {}

void main() {
  final datasource = GetFilteredAdsDatasourceMock();
  final respository = GetFilteredAdsRepositoryImp(datasource);
  final adList = [
    AdModel(
      title: 'Novo anuncio',
      description: 'descrição do anuncio',
      price: 350.00,
      status: AdStatus.ACTIVE,
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
  final filter = AdFilterModel(orderBy: OrderBy.DATE, vendorType: 1);
  final search = '';
  final category = CategoryModel(description: 'description of category');
  final page = 0;

  test('should get Filtered Ads', () async {
    when(() => datasource.getFilteredAds(
          filter: filter,
          search: search,
          category: category,
          page: page,
        )).thenAnswer((_) async => Right(adList));

    final result = await respository.getFilteredAds(
      filter: filter,
      search: search,
      category: category,
      page: page,
    );

    expect(result, isA<Right<dynamic, List<AdModel>>>());
  });

  test('should return a ErrorGetFilteredAds', () async {
    when(() => datasource.getFilteredAds(
          filter: filter,
          search: search,
          category: category,
          page: page,
        )).thenThrow((_) async => Left(ErrorGetFilteredAds()));

    final result = (await respository.getFilteredAds(
      filter: filter,
      search: search,
      category: category,
      page: page,
    ))
        .fold(id, id);

    expect(result, isA<ErrorGetFilteredAds>());
  });
}
