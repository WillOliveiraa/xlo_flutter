import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';

abstract class GetAllAdsUseCase {
  Future<Either<Failure, List<AdEntity>?>> call(String adId);
}

class GetAllAdsUseCaseImp implements GetAllAdsUseCase {
  final GetAllAdsRepository _repository;

  GetAllAdsUseCaseImp(this._repository);

  @override
  Future<Either<Failure, List<AdEntity>?>> call(String adId) async {
    return await _repository.getAllAds(adId);
  }
}

abstract class GetAllAdsRepository {
  Future<Either<Failure, List<AdEntity>?>> getAllAds(String adId);
}

class GetAllAdsRepositoryMock extends Mock implements GetAllAdsRepository {}

class ErrorGetAllAds extends Failure {
  @override
  String? get message => 'Ocorreu um erro ao tentar obter os anúncios';

  @override
  List<Object?> get props => throw UnimplementedError();
}

void main() {
  final repository = GetAllAdsRepositoryMock();
  final usecase = GetAllAdsUseCaseImp(repository);
  final adList = [
    AdEntity(
      title: 'Novo anuncio',
      description: 'descrição do anuncio',
      price: 350.00,
      images: [''],
    ),
  ];
  final adId = 'adId';

  test('should get all ads', () async {
    when(() => repository.getAllAds(adId))
        .thenAnswer((_) async => Right(adList));

    final result = (await usecase(adId)).fold((l) => null, (r) => r);

    expect(result, isA<List<AdEntity>>());
  });

  test('should return a ErrorGetAllAds', () async {
    when(() => repository.getAllAds(adId))
        .thenAnswer((_) async => Left(ErrorGetAllAds()));

    final result = (await usecase(adId)).fold(id, id);

    expect(result, isA<ErrorGetAllAds>());
  });
}
