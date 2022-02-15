import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/data/models/category_model.dart';

abstract class GetAllCategoriesDatasource {
  Future<Either<Failure, List<CategoryModel>?>> getAllCategories();
}
