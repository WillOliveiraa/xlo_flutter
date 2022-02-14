import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/domain/entities/category_entity.dart';

abstract class GetAllCategoriesRepository {
  Future<Either<Failure, List<CategoryEntity>?>> getAllCategories();
}
