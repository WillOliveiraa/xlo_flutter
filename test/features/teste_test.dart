// import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// class GetAllCategoriesDatasourceMock extends Mock
//     implements GetAllCategoriesDatasource {}

void main() {
  test('should get all categories', () async {
    // when(() => datasource.getAllCategories())
    //     .thenAnswer((_) async => Right(categories));

    // final result = await repository.getAllCategories();

    // expect(result, isA<Right<dynamic, List<CategoryModel>?>>());
    // verify(() => datasource.getAllCategories()).called(1);
    // verifyNoMoreInteractions(datasource);
  });

  test('should return a ErrorGetAllCategories', () async {
    // when(() => datasource.getAllCategories())
    //     .thenAnswer((_) async => Left(ErrorGetAllCategories()));

    // final result = (await repository.getAllCategories()).fold(id, id);

    // expect(result, isA<ErrorGetAllCategories>());
    // verify(() => datasource.getAllCategories()).called(1);
    // verifyNoMoreInteractions(datasource);
  });
}
