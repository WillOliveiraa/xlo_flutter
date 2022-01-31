import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/auth/domain/entities/sign_up_user_entity.dart';
import 'package:xlo_flutter/features/auth/domain/errors/error_sign_up_user.dart';
import 'package:xlo_flutter/features/auth/domain/repositories/sign_up_user_repository.dart';
import 'package:xlo_flutter/features/auth/domain/usecases/sign_up_user_usecase.dart';

class SignUpUserRepositoryMock extends Mock implements SignUpUserRepository {}

void main() {
  final repository = SignUpUserRepositoryMock();
  final usecase = SignUpUserUseCaseImp(repository);
  final userEntity = SignUpUserEntity(
      name: 'Will Oliveira',
      email: 'will@teste.com',
      password: '123123',
      passwordConf: '123123',
      phone: '123123123123123');

  test('should sign up user', () async {
    when(() => repository.signUpUser(userEntity))
        .thenAnswer((_) async => Right(userEntity));

    final result = (await usecase(userEntity)).fold(id, id);

    expect(result, userEntity);
    verify(() => repository.signUpUser(userEntity)).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('should return a ErrorSignUpUser', () async {
    when(() => repository.signUpUser(userEntity))
        .thenAnswer((_) async => Left(ErrorSignUpUser()));

    final result = (await usecase(userEntity)).fold(id, id);

    expect(result, isA<ErrorSignUpUser>());
    verify(() => repository.signUpUser(userEntity)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
