import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';

abstract class SaveAdUseCase {
  Future<Either<Failure, Unit>> call(AdEntity adEntity);
}

class SaveAdUseCaseImp implements SaveAdUseCase {
  final SaveAdRespository _repository;

  SaveAdUseCaseImp(this._repository);

  @override
  Future<Either<Failure, Unit>> call(AdEntity adEntity) async {
    return await _repository.saveAd(adEntity);
  }
}

abstract class SaveAdRespository {
  Future<Either<Failure, Unit>> saveAd(AdEntity adEntity);
}

class SaveAdRepositoryMock extends Mock implements SaveAdRespository {}

void main() {
  final repository = SaveAdRepositoryMock();
  final usecase = SaveAdUseCaseImp(repository);
  final adEntity = AdEntity(
    title: 'Novo anuncio',
    description: 'descrição do anuncio',
    price: 350.00,
    images: [],
  );

  test('should save the ad', () async {
    when(() => repository.saveAd(adEntity))
        .thenAnswer((_) async => Right(unit));

    final result = (await usecase(adEntity)).fold((l) => null, (r) => r);

    expect(result, unit);
  });
}
