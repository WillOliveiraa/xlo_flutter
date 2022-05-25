import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/domain/entities/city_entity.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/get_all_cities_repository.dart';

abstract class GetAllCitiesUseCase {
  Future<Either<Failure, List<CityEntity>>> call(String ufId);
}

class GetAllCitiesUseCaseImp implements GetAllCitiesUseCase {
  GetAllCitiesUseCaseImp(this._repository);

  final GetAllCitiesRepository _repository;

  @override
  Future<Either<Failure, List<CityEntity>>> call(String ufId) async {
    final result = await _repository.getAllCities(ufId);
    return result;
  }
}
