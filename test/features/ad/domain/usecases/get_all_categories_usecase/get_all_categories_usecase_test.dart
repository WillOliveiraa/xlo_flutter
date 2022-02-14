import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/ad/domain/entities/category_entity.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_all_categories.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/get_all_categories_repository.dart';
import 'package:xlo_flutter/features/ad/domain/usecases/get_all_categories_usecase/get_all_categories_usecase.dart';

class GetAllCategoriesRepositoryMock extends Mock
    implements GetAllCategoriesRepository {}

void main() {
  final repository = GetAllCategoriesRepositoryMock();
  final usecase = GetAllCategoriesUseCaseImp(repository);
  final categories = [CategoryEntity('description of category')];

  test('should get all categories', () async {
    when(() => repository.getAllCategories())
        .thenAnswer((_) async => Right(categories));

    final result = (await usecase()).fold((l) => l, (r) => r);

    expect(result, isA<List<CategoryEntity>>());
    verify(() => repository.getAllCategories()).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('should return a ErrorGetAllCategories', () async {
    when(() => repository.getAllCategories())
        .thenAnswer((_) async => Left(ErrorGetAllCategories()));

    final result = (await usecase()).fold(id, id);

    expect(result, isA<ErrorGetAllCategories>());
    verify(() => repository.getAllCategories()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
