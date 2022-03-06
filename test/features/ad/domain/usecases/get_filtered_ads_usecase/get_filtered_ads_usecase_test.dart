import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_filter_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/address_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/category_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/city_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/uf_entity.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_filtered_ads.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/get_filtered_ads_repository.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_filtered_ads_usecase/get_filtered_ads_usecase.dart';
import 'package:xlo_flutter/features/auth/data/models/user_model.dart';

class GetFilteredAdsRepositoryMock extends Mock
    implements GetFilteredAdsRepository {}

void main() {
  final repository = GetFilteredAdsRepositoryMock();
  final usecase = GetFilteredAdsUseCaseImp(repository);
  final adList = [
    AdEntity(
      title: 'Novo anuncio',
      description: 'descrição do anuncio',
      price: 350.00,
      images: [''],
      category: CategoryEntity(description: 'new description'),
      owner: UserModel(name: '', email: ''),
      address: AddressEntity(
        uf: UfEntity(initials: '', name: ''),
        city: CityEntity(name: ''),
        cep: '',
        district: '',
      ),
    ),
  ];
  final filter = AdFilterEntity();
  final search = '';
  final category = CategoryEntity(description: 'description of category');
  final page = 0;

  test('should get Filtered ads', () async {
    when(() => repository.getFilteredAds(
          filter: filter,
          search: search,
          category: category,
          page: page,
        )).thenAnswer((_) async => Right(adList));

    final result = (await usecase(
      filter: filter,
      search: search,
      category: category,
      page: page,
    ))
        .fold((l) => null, (r) => r);

    expect(result, isA<List<AdEntity>>());
  });

  test('should return a ErrorGetFilteredAds', () async {
    when(() => repository.getFilteredAds(
          filter: filter,
          search: search,
          category: category,
          page: page,
        )).thenAnswer((_) async => Left(ErrorGetFilteredAds()));

    final result = (await usecase(
      filter: filter,
      search: search,
      category: category,
      page: page,
    ))
        .fold(id, id);

    expect(result, isA<ErrorGetFilteredAds>());
  });
}
