import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/address_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/category_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/city_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/uf_entity.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_my_ads.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/get_my_ads_repository.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_my_ads_usecase/get_my_ads_usecase.dart';
import 'package:xlo_flutter/features/auth/data/models/user_model.dart';

class GetMyAdsRepositoryMock extends Mock implements GetMyAdsRepository {}

void main() {
  final repository = GetMyAdsRepositoryMock();
  final usecase = GetMyAdsUseCaseImp(repository);
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

  test('should get my ads', () async {
    when(() => repository.getMyAds()).thenAnswer((_) async => Right(adList));

    final result = (await usecase()).fold((l) => null, (r) => r);

    expect(result, isA<List<AdEntity>>());
  });

  test('should return a ErrorGetMyAds', () async {
    when(() => repository.getMyAds())
        .thenAnswer((_) async => Left(ErrorGetMyAds()));

    final result = (await usecase()).fold(id, id);

    expect(result, isA<ErrorGetMyAds>());
  });
}
