import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// class GetAllCategoriesRepositoryMock extends Mock
//     implements GetAllCategoriesRepository {}

void main() {
  test('should get all categories', () async {
    // when(() => repository.getAllCategories())
    //     .thenAnswer((_) async => Right(categories));

    // final result = (await usecase()).fold((l) => l, (r) => r);

    // expect(result, isA<List<CategoryEntity>>());
    // verify(() => repository.getAllCategories()).called(1);
    // verifyNoMoreInteractions(repository);
  });

  test('should return a ErrorGetAllCategories', () async {
    // when(() => repository.getAllCategories())
    //     .thenAnswer((_) async => Left(ErrorGetAllCategories()));

    // final result = (await usecase()).fold(id, id);

    // expect(result, isA<ErrorGetAllCategories>());
    // verify(() => repository.getAllCategories()).called(1);
    // verifyNoMoreInteractions(repository);
  });
}
