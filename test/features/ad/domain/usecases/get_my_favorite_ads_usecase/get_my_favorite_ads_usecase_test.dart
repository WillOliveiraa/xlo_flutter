import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/address_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/category_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/city_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/uf_entity.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_my_favorite_ads.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/get_my_favorite_ads_repository.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_my_favorite_ads_usecase/get_my_favorite_ads_usecase.dart';
import 'package:xlo_flutter/features/auth/data/models/user_model.dart';

class GetMyFavoriteAdsRepositoryMock extends Mock
    implements GetMyFavoriteAdsRepository {}

void main() {
  final repository = GetMyFavoriteAdsRepositoryMock();
  final usecase = GetMyFavoriteAdsUseCaseImp(repository);
  const userId = 'userID';
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

  test('should get my favorite ads', () async {
    when(() => repository.getMyFavoriteAds(userId))
        .thenAnswer((_) async => Right(adList));

    final result = (await usecase(userId)).fold((l) => null, (r) => r);

    expect(result, isA<List<AdEntity>>());
  });

  test('should return a ErrorGetMyFavoriteAds', () async {
    when(() => repository.getMyFavoriteAds(userId))
        .thenAnswer((_) async => Left(ErrorGetMyFavoriteAds()));

    final result = (await usecase(userId)).fold(id, id);

    expect(result, isA<ErrorGetMyFavoriteAds>());
  });
}
