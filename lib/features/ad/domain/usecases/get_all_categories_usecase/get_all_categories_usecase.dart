import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/domain/entities/category_entity.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/get_all_categories_repository.dart';

abstract class GetAllCategoriesUseCase {
  Future<Either<Failure, List<CategoryEntity>?>> call();
}

class GetAllCategoriesUseCaseImp implements GetAllCategoriesUseCase {
  final GetAllCategoriesRepository _repository;

  GetAllCategoriesUseCaseImp(this._repository);

  @override
  Future<Either<Failure, List<CategoryEntity>?>> call() async {
    return await _repository.getAllCategories();
  }
}
