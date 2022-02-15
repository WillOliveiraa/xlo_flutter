import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/data/datasources/get_all_categories_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/category_model.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_all_categories.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/get_all_categories_repository.dart';

class GetAllCategoriesRepositoryImp implements GetAllCategoriesRepository {
  final GetAllCategoriesDatasource _datasource;

  GetAllCategoriesRepositoryImp(this._datasource);

  @override
  Future<Either<Failure, List<CategoryModel>?>> getAllCategories() async {
    try {
      return await _datasource.getAllCategories();
    } catch (e) {
      return Left(ErrorGetAllCategories());
    }
  }
}
