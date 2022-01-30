import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xlo_flutter/features/login/domain/entities/user_entity.dart';
import 'package:xlo_flutter/features/login/domain/errors/error_sign_in_with_email.dart';
import 'package:xlo_flutter/features/login/domain/repositories/sign_in_with_email_repository.dart';
import 'package:xlo_flutter/features/login/domain/usecases/sign_in_with_email_usecase.dart';

class SignInWithEmailRepositoryMock extends Mock
    implements SignInWithEmailRepository {}

void main() {
  final repository = SignInWithEmailRepositoryMock();
  final usecase = SignInWithEmailUseCaseImp(repository);
  final userEntity = UserEntity(
    name: 'Will Oliveira',
    email: 'will@teste.com',
    password: '123123',
  );

  test('should sign in with email', () async {
    when(() => repository.signInWithEmail(
            email: userEntity.email, password: userEntity.password!))
        .thenAnswer((_) async => Right(userEntity));

    final result = (await usecase(userEntity.email, userEntity.password!))
        .fold((l) => null, (r) => r);

    expect(result, userEntity);
    verify(() => repository.signInWithEmail(
        email: userEntity.email, password: userEntity.password!)).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('should return a ErrorSignInWithEmail', () async {
    when(() => repository.signInWithEmail(
            email: userEntity.email, password: userEntity.password!))
        .thenAnswer((_) async => Left(ErrorSignInWithEmail()));

    final result =
        (await usecase(userEntity.email, userEntity.password!)).fold(id, id);

    expect(result, isA<ErrorSignInWithEmail>());
    verify(() => repository.signInWithEmail(
        email: userEntity.email, password: userEntity.password!)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
