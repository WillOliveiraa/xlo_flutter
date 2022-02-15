import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/ad/data/datasources/get_all_categories_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/category_model.dart';
import 'package:xlo_flutter/features/ad/data/repositories/get_all_categories_repository_imp.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_all_categories.dart';

class GetAllCategoriesDatasourceMock extends Mock
    implements GetAllCategoriesDatasource {}

void main() {
  final datasource = GetAllCategoriesDatasourceMock();
  final repository = GetAllCategoriesRepositoryImp(datasource);
  final categories = [CategoryModel(description: 'descrição do anuncio')];

  test('should get all categories', () async {
    when(() => datasource.getAllCategories())
        .thenAnswer((_) async => Right(categories));

    final result = await repository.getAllCategories();

    expect(result, isA<Right<dynamic, List<CategoryModel>?>>());
    verify(() => datasource.getAllCategories()).called(1);
    verifyNoMoreInteractions(datasource);
  });

  test('should return a ErrorGetAllCategories', () async {
    when(() => datasource.getAllCategories())
        .thenAnswer((_) async => Left(ErrorGetAllCategories()));

    final result = (await repository.getAllCategories()).fold(id, id);

    expect(result, isA<ErrorGetAllCategories>());
    verify(() => datasource.getAllCategories()).called(1);
    verifyNoMoreInteractions(datasource);
  });
}
