import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/ad/data/datasources/save_ad_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/address_model.dart';
import 'package:xlo_flutter/features/ad/data/models/category_model.dart';
import 'package:xlo_flutter/features/ad/data/models/city_model.dart';
import 'package:xlo_flutter/features/ad/data/models/uf_model.dart';
import 'package:xlo_flutter/features/ad/data/repositories/save_ad_repository_imp.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_save_ad.dart';
import 'package:xlo_flutter/features/auth/data/models/user_model.dart';

class SaveAdDatasourceMock extends Mock implements SaveAdDatasource {}

void main() {
  final datasource = SaveAdDatasourceMock();
  final respository = SaveAdRepositoryImp(datasource);
  final adEntity = AdEntity(
    title: 'Novo anuncio',
    description: 'descrição do anuncio',
    price: 350.00,
    images: [],
    category: CategoryModel(description: 'new description'),
    owner: UserModel(name: '', email: ''),
    address: AddressModel(
      uf: UfModel(initials: '', name: ''),
      city: CityModel(name: ''),
      cep: '',
      district: '',
    ),
  );

  test('should save a ad', () async {
    when(() => datasource.saveAd(adEntity))
        .thenAnswer((_) async => const Right(unit));

    final result = await respository.saveAd(adEntity);

    expect(result, isA<Right<dynamic, Unit>>());
  });

  test('should return a ErrorSaveAd', () async {
    when(() => datasource.saveAd(adEntity))
        .thenAnswer((_) async => Left(ErrorSaveAd()));

    final result = (await respository.saveAd(adEntity)).fold(id, id);

    expect(result, isA<ErrorSaveAd>());
  });
}
