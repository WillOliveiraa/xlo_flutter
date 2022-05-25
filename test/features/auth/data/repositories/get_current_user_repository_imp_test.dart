import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/auth/data/datasources/get_current_user_datasource.dart';
import 'package:xlo_flutter/features/auth/data/models/user_model.dart';
import 'package:xlo_flutter/features/auth/data/repositories/get_current_user_repository_imp.dart';
import 'package:xlo_flutter/features/auth/domain/errors/error_get_current_user.dart';

class GetCurrentUserDatasourceMock extends Mock
    implements GetCurrentUserDatasource {}

void main() {
  final datasource = GetCurrentUserDatasourceMock();
  final repository = GetCurrentUserRepositoryImp(datasource);
  final userModel = UserModel(
    id: 'jklj231s',
    name: 'Will Oliveira',
    email: 'will@teste.com',
    password: '123123',
  );

  test('should get current user', () async {
    when(() => datasource.getCurrentUser())
        .thenAnswer((_) async => Right(userModel));

    final result = await repository.getCurrentUser();

    expect(result, isA<Right<Failure, UserModel>>());
    verify(() => datasource.getCurrentUser()).called(1);
  });

  test('should return a ErrorGetCurrentUser', () async {
    when(() => datasource.getCurrentUser()).thenThrow(ErrorGetCurrentUser());

    final result = (await repository.getCurrentUser()).fold(id, id);

    expect(result, isA<ErrorGetCurrentUser>());
    verify(() => datasource.getCurrentUser()).called(1);
  });
}
