import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/auth/data/datasources/sign_up_user_datasource.dart';
import 'package:xlo_flutter/features/auth/data/models/user_model.dart';
import 'package:xlo_flutter/features/auth/data/repositories/sign_up_user_repository_imp.dart';
import 'package:xlo_flutter/features/auth/domain/entities/sign_up_user_entity.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/auth/domain/errors/error_sign_up_user.dart';

class SignUpUserDatasourceMock extends Mock implements SignUpUserDatasource {}

void main() {
  final datasource = SignUpUserDatasourceMock();
  final repository = SignUpUserRepositoryImp(datasource);
  final signUpUserEntity = SignUpUserEntity(
      name: 'Will Oliveira',
      email: 'will@teste.com',
      password: '123123',
      phone: '123123123123123');
  final userModel = UserModel(
    name: signUpUserEntity.name,
    email: signUpUserEntity.email,
    password: signUpUserEntity.password,
  );

  test('should sign up user', () async {
    when(() => datasource.signUpUser(signUpUserEntity))
        .thenAnswer((_) async => Right(userModel));

    final result = await repository.signUpUser(signUpUserEntity);

    expect(result, isA<Right<Failure, UserModel>>());
    verify(() => datasource.signUpUser(signUpUserEntity)).called(1);
  });

  test('should return a ErrorSignUpUser', () async {
    when(() => datasource.signUpUser(signUpUserEntity))
        .thenThrow(ErrorSignUpUser());

    final result = (await repository.signUpUser(signUpUserEntity)).fold(id, id);

    expect(result, isA<ErrorSignUpUser>());
    verify(() => datasource.signUpUser(signUpUserEntity)).called(1);
  });
}
