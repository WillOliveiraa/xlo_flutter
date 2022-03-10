import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/auth/data/datasources/save_user_datasource.dart';
import 'package:xlo_flutter/features/auth/data/repositories/save_user_repository_imp.dart';
import 'package:xlo_flutter/features/auth/domain/entities/sign_up_user_entity.dart';
import 'package:xlo_flutter/features/auth/domain/errors/error_save_user.dart';

class SaveUserDatasourceMock extends Mock implements SaveUserDatasource {}

void main() {
  final datasource = SaveUserDatasourceMock();
  final repository = SaveUserRepositoryImp(datasource);
  final signUpUserEntity = SignUpUserEntity(
      name: 'Will Oliveira',
      email: 'will@teste.com',
      password: null,
      passwordConf: null,
      phone: '123123123123123');

  test('should save user', () async {
    when(() => datasource.saveUser(signUpUserEntity))
        .thenAnswer((_) async => Right(unit));

    final result = await repository.saveUser(signUpUserEntity);

    expect(result, isA<Right<Failure, Unit>>());
    verify(() => datasource.saveUser(signUpUserEntity)).called(1);
  });

  test('should return a ErrorSaveUser', () async {
    when(() => datasource.saveUser(signUpUserEntity))
        .thenThrow(ErrorSaveUser());

    final result = (await repository.saveUser(signUpUserEntity)).fold(id, id);

    expect(result, isA<ErrorSaveUser>());
    verify(() => datasource.saveUser(signUpUserEntity)).called(1);
  });
}
