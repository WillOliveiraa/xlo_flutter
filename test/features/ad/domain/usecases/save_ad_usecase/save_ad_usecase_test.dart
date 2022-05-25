import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/address_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/category_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/city_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/uf_entity.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_save_ad.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/save_ad_repository.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/save_ad_usecase/save_ad_usecase.dart';
import 'package:xlo_flutter/features/auth/data/models/user_model.dart';

class SaveAdRepositoryMock extends Mock implements SaveAdRepository {}

void main() {
  final repository = SaveAdRepositoryMock();
  final usecase = SaveAdUseCaseImp(repository);
  final adEntity = AdEntity(
    title: 'Novo anuncio',
    description: 'descrição do anuncio',
    price: 350.00,
    images: [],
    category: CategoryEntity(description: 'new description'),
    owner: UserModel(name: '', email: ''),
    address: AddressEntity(
      uf: UfEntity(initials: '', name: ''),
      city: CityEntity(name: ''),
      cep: '',
      district: '',
    ),
  );

  test('should save the ad', () async {
    when(() => repository.saveAd(adEntity))
        .thenAnswer((_) async => const Right(unit));

    final result = (await usecase(adEntity)).fold((l) => null, (r) => r);

    expect(result, unit);
  });

  test('should return a ErrorSaveAd', () async {
    when(() => repository.saveAd(adEntity))
        .thenAnswer((_) async => Left(ErrorSaveAd()));

    final result = (await usecase(adEntity)).fold(id, id);

    expect(result, isA<ErrorSaveAd>());
  });
}
