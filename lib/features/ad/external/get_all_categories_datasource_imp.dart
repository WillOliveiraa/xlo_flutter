import 'package:dartz/dartz.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/core/shared/utils/table_keys.dart';
import 'package:xlo_flutter/features/ad/data/datasources/get_all_categories_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/category_model.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_all_categories.dart';

class GetAllCategoriesDatasourceImp implements GetAllCategoriesDatasource {
  @override
  Future<Either<Failure, List<CategoryModel>?>> getAllCategories() async {
    final ParseResponse response = await ParseObject(keyCategoryTable).getAll();

    final List<CategoryModel> categories = [];
    if (response.success) {
      for (final ParseObject object in response.result) {
        final CategoryModel obj = CategoryModel.fromParse(object);
        categories.add(obj);
      }
      return Right(categories);
    } else {
      return Left(ErrorGetAllCategories());
    }
  }
}
